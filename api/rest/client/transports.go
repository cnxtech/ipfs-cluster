package client

import (
	"context"
	"crypto/tls"
	"errors"
	"net"
	"net/http"
	"time"

	p2phttp "github.com/hsanjuan/go-libp2p-http"
	libp2p "github.com/libp2p/go-libp2p"
	ipnet "github.com/libp2p/go-libp2p-interface-pnet"
	peer "github.com/libp2p/go-libp2p-peer"
	peerstore "github.com/libp2p/go-libp2p-peerstore"
	pnet "github.com/libp2p/go-libp2p-pnet"
	madns "github.com/multiformats/go-multiaddr-dns"
)

// This is essentially a http.DefaultTransport. We should not mess
// with it since it's a global variable, and we don't know who else uses
// it, so we create our own.
// TODO: Allow more configuration options.
func (c *defaultClient) defaultTransport() {
	c.transport = &http.Transport{
		Proxy: http.ProxyFromEnvironment,
		DialContext: (&net.Dialer{
			Timeout:   30 * time.Second,
			KeepAlive: 30 * time.Second,
			DualStack: true,
		}).DialContext,
		MaxIdleConns:          100,
		IdleConnTimeout:       90 * time.Second,
		TLSHandshakeTimeout:   10 * time.Second,
		ExpectContinueTimeout: 1 * time.Second,
	}
	c.net = "http"
}

func (c *defaultClient) enableLibp2p() error {
	c.defaultTransport()

	pinfo, err := peerstore.InfoFromP2pAddr(c.config.APIAddr)
	if err != nil {
		return err
	}

	if len(pinfo.Addrs) == 0 {
		return errors.New("APIAddr only includes a Peer ID")
	}

	var prot ipnet.Protector
	if c.config.ProtectorKey != nil && len(c.config.ProtectorKey) > 0 {
		if len(c.config.ProtectorKey) != 32 {
			return errors.New("length of ProtectorKey should be 32")
		}
		var key [32]byte
		copy(key[:], c.config.ProtectorKey)

		prot, err = pnet.NewV1ProtectorFromBytes(&key)
		if err != nil {
			return err
		}
	}

	h, err := libp2p.New(c.ctx, libp2p.PrivateNetwork(prot))
	if err != nil {
		return err
	}

	ctx, cancel := context.WithTimeout(c.ctx, ResolveTimeout)
	defer cancel()
	resolvedAddrs, err := madns.Resolve(ctx, pinfo.Addrs[0])
	if err != nil {
		return err
	}

	h.Peerstore().AddAddrs(pinfo.ID, resolvedAddrs, peerstore.PermanentAddrTTL)
	c.transport.RegisterProtocol("libp2p", p2phttp.NewTransport(h))
	c.net = "libp2p"
	c.p2p = h
	c.hostname = peer.IDB58Encode(pinfo.ID)
	return nil
}

func (c *defaultClient) enableTLS() error {
	c.defaultTransport()
	// based on https://github.com/denji/golang-tls
	c.transport.TLSClientConfig = &tls.Config{
		MinVersion:               tls.VersionTLS12,
		CurvePreferences:         []tls.CurveID{tls.CurveP521, tls.CurveP384, tls.CurveP256},
		PreferServerCipherSuites: true,
		CipherSuites: []uint16{
			tls.TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,
			tls.TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA,
			tls.TLS_RSA_WITH_AES_256_GCM_SHA384,
			tls.TLS_RSA_WITH_AES_256_CBC_SHA,
		},
		InsecureSkipVerify: c.config.NoVerifyCert,
	}
	c.net = "https"
	return nil
}
