module github.com/ipfs/ipfs-cluster

require (
	contrib.go.opencensus.io/exporter/jaeger v0.1.0
	contrib.go.opencensus.io/exporter/prometheus v0.1.0
	github.com/blang/semver v3.5.1+incompatible
	github.com/dustin/go-humanize v1.0.0
	github.com/gogo/protobuf v1.3.2
	github.com/golang/protobuf v1.3.1
	github.com/google/uuid v1.1.1
	github.com/gorilla/mux v1.7.2
	github.com/hashicorp/go-hclog v0.9.1
	github.com/hashicorp/raft v1.1.0
	github.com/hashicorp/raft-boltdb v0.0.0-20171010151810-6e5ba93211ea
	github.com/hsanjuan/go-libp2p-gostream v0.0.34
	github.com/hsanjuan/go-libp2p-http v0.0.5
	github.com/hsanjuan/ipfs-lite v0.0.8
	github.com/ipfs/go-block-format v0.0.2
	github.com/ipfs/go-cid v0.0.2
	github.com/ipfs/go-datastore v0.0.5
	github.com/ipfs/go-ds-badger v0.0.3
	github.com/ipfs/go-ds-crdt v0.0.14
	github.com/ipfs/go-fs-lock v0.0.1
	github.com/ipfs/go-ipfs-api v0.0.1
	github.com/ipfs/go-ipfs-blockstore v0.0.1
	github.com/ipfs/go-ipfs-chunker v0.0.1
	github.com/ipfs/go-ipfs-ds-help v0.0.1
	github.com/ipfs/go-ipfs-files v0.0.3
	github.com/ipfs/go-ipfs-posinfo v0.0.1
	github.com/ipfs/go-ipfs-util v0.0.1
	github.com/ipfs/go-ipld-cbor v0.0.2
	github.com/ipfs/go-ipld-format v0.0.2
	github.com/ipfs/go-log v0.0.1
	github.com/ipfs/go-merkledag v0.0.6
	github.com/ipfs/go-mfs v0.0.11
	github.com/ipfs/go-path v0.0.7
	github.com/ipfs/go-unixfs v0.0.8
	github.com/kelseyhightower/envconfig v1.3.0
	github.com/lanzafame/go-libp2p-ocgorpc v0.0.4
	github.com/libp2p/go-libp2p v0.0.30
	github.com/libp2p/go-libp2p-connmgr v0.0.6
	github.com/libp2p/go-libp2p-consensus v0.0.1
	github.com/libp2p/go-libp2p-crypto v0.1.0
	github.com/libp2p/go-libp2p-gorpc v0.0.5
	github.com/libp2p/go-libp2p-host v0.0.3
	github.com/libp2p/go-libp2p-interface-pnet v0.0.1
	github.com/libp2p/go-libp2p-kad-dht v0.0.14
	github.com/libp2p/go-libp2p-peer v0.2.0
	github.com/libp2p/go-libp2p-peerstore v0.1.0
	github.com/libp2p/go-libp2p-pnet v0.0.1
	github.com/libp2p/go-libp2p-protocol v0.1.0
	github.com/libp2p/go-libp2p-pubsub v0.0.6
	github.com/libp2p/go-libp2p-raft v0.0.3
	github.com/libp2p/go-ws-transport v0.0.5
	github.com/multiformats/go-multiaddr v0.0.4
	github.com/multiformats/go-multiaddr-dns v0.0.2
	github.com/multiformats/go-multiaddr-net v0.0.1
	github.com/multiformats/go-multicodec v0.1.6
	github.com/multiformats/go-multihash v0.0.5
	github.com/pkg/errors v0.8.1
	github.com/prometheus/client_golang v0.9.3
	github.com/rs/cors v1.6.0
	github.com/ugorji/go v1.1.4
	github.com/urfave/cli v1.20.0
	github.com/zenground0/go-dot v0.0.0-20180912213407-94a425d4984e
	go.opencensus.io v0.21.0
	gonum.org/v1/gonum v0.0.0-20190520094443-a5f8f3a4840b
	gonum.org/v1/plot v0.0.0-20190515093506-e2840ee46a6b
)

require (
	github.com/AndreasBriese/bbloom v0.0.0-20180913140656-343706a395b7 // indirect
	github.com/Stebalien/go-bitfield v0.0.1 // indirect
	github.com/ajstarks/svgo v0.0.0-20180226025133-644b8db467af // indirect
	github.com/apache/thrift v0.12.0 // indirect
	github.com/armon/go-metrics v0.0.0-20190430140413-ec5e00d3c878 // indirect
	github.com/beorn7/perks v1.0.0 // indirect
	github.com/boltdb/bolt v1.3.1 // indirect
	github.com/btcsuite/btcd v0.0.0-20190523000118-16327141da8c // indirect
	github.com/coreos/go-semver v0.3.0 // indirect
	github.com/cskr/pubsub v1.0.2 // indirect
	github.com/davidlazar/go-crypto v0.0.0-20170701192655-dcfb0a7ac018 // indirect
	github.com/dgraph-io/badger v2.0.0-rc.2+incompatible // indirect
	github.com/dgryski/go-farm v0.0.0-20190104051053-3adb47b1fb0f // indirect
	github.com/fogleman/gg v1.2.1-0.20190220221249-0403632d5b90 // indirect
	github.com/golang/freetype v0.0.0-20170609003504-e2365dfdc4a0 // indirect
	github.com/gorilla/websocket v1.4.0 // indirect
	github.com/hashicorp/go-immutable-radix v1.1.0 // indirect
	github.com/hashicorp/go-msgpack v0.5.5 // indirect
	github.com/hashicorp/golang-lru v0.5.1 // indirect
	github.com/huin/goupnp v1.0.0 // indirect
	github.com/ipfs/bbloom v0.0.1 // indirect
	github.com/ipfs/go-bitswap v0.0.9 // indirect
	github.com/ipfs/go-blockservice v0.0.7 // indirect
	github.com/ipfs/go-ipfs-addr v0.0.1 // indirect
	github.com/ipfs/go-ipfs-config v0.0.4 // indirect
	github.com/ipfs/go-ipfs-exchange-interface v0.0.1 // indirect
	github.com/ipfs/go-ipfs-exchange-offline v0.0.1 // indirect
	github.com/ipfs/go-ipfs-pq v0.0.1 // indirect
	github.com/ipfs/go-metrics-interface v0.0.1 // indirect
	github.com/ipfs/go-peertaskqueue v0.0.4 // indirect
	github.com/ipfs/go-todocounter v0.0.1 // indirect
	github.com/ipfs/go-verifcid v0.0.1 // indirect
	github.com/jackpal/gateway v1.0.5 // indirect
	github.com/jackpal/go-nat-pmp v1.0.1 // indirect
	github.com/jbenet/go-context v0.0.0-20150711004518-d14ea06fba99 // indirect
	github.com/jbenet/go-temp-err-catcher v0.0.0-20150120210811-aac704a3f4f2 // indirect
	github.com/jbenet/goprocess v0.1.3 // indirect
	github.com/jung-kurt/gofpdf v1.0.3-0.20190309125859-24315acbbda5 // indirect
	github.com/koron/go-ssdp v0.0.0-20180514024734-4a0ed625a78b // indirect
	github.com/libp2p/go-addr-util v0.0.1 // indirect
	github.com/libp2p/go-buffer-pool v0.0.2 // indirect
	github.com/libp2p/go-conn-security v0.0.1 // indirect
	github.com/libp2p/go-conn-security-multistream v0.0.2 // indirect
	github.com/libp2p/go-flow-metrics v0.0.1 // indirect
	github.com/libp2p/go-libp2p-autonat v0.0.6 // indirect
	github.com/libp2p/go-libp2p-circuit v0.0.9 // indirect
	github.com/libp2p/go-libp2p-core v0.0.1 // indirect
	github.com/libp2p/go-libp2p-discovery v0.0.5 // indirect
	github.com/libp2p/go-libp2p-interface-connmgr v0.0.5 // indirect
	github.com/libp2p/go-libp2p-kbucket v0.1.1 // indirect
	github.com/libp2p/go-libp2p-loggables v0.0.1 // indirect
	github.com/libp2p/go-libp2p-metrics v0.0.1 // indirect
	github.com/libp2p/go-libp2p-mplex v0.1.1 // indirect
	github.com/libp2p/go-libp2p-nat v0.0.4 // indirect
	github.com/libp2p/go-libp2p-net v0.0.2 // indirect
	github.com/libp2p/go-libp2p-record v0.0.1 // indirect
	github.com/libp2p/go-libp2p-routing v0.0.1 // indirect
	github.com/libp2p/go-libp2p-secio v0.0.3 // indirect
	github.com/libp2p/go-libp2p-swarm v0.0.6 // indirect
	github.com/libp2p/go-libp2p-transport v0.0.5 // indirect
	github.com/libp2p/go-libp2p-transport-upgrader v0.0.4 // indirect
	github.com/libp2p/go-libp2p-yamux v0.1.3 // indirect
	github.com/libp2p/go-maddr-filter v0.0.4 // indirect
	github.com/libp2p/go-mplex v0.0.4 // indirect
	github.com/libp2p/go-msgio v0.0.2 // indirect
	github.com/libp2p/go-nat v0.0.3 // indirect
	github.com/libp2p/go-reuseport v0.0.1 // indirect
	github.com/libp2p/go-reuseport-transport v0.0.2 // indirect
	github.com/libp2p/go-stream-muxer v0.1.0 // indirect
	github.com/libp2p/go-stream-muxer-multistream v0.1.1 // indirect
	github.com/libp2p/go-tcp-transport v0.0.4 // indirect
	github.com/libp2p/go-yamux v1.2.3 // indirect
	github.com/mattn/go-colorable v0.1.2 // indirect
	github.com/mattn/go-isatty v0.0.8 // indirect
	github.com/matttproud/golang_protobuf_extensions v1.0.1 // indirect
	github.com/minio/blake2b-simd v0.0.0-20160723061019-3f5f724cb5b1 // indirect
	github.com/minio/sha256-simd v0.1.0 // indirect
	github.com/mitchellh/go-homedir v1.1.0 // indirect
	github.com/mr-tron/base58 v1.1.2 // indirect
	github.com/multiformats/go-base32 v0.0.3 // indirect
	github.com/multiformats/go-multibase v0.0.1 // indirect
	github.com/multiformats/go-multistream v0.1.0 // indirect
	github.com/opentracing/opentracing-go v1.1.0 // indirect
	github.com/polydawn/refmt v0.0.0-20190221155625-df39d6c2d992 // indirect
	github.com/prometheus/client_model v0.0.0-20190129233127-fd36f4220a90 // indirect
	github.com/prometheus/common v0.4.0 // indirect
	github.com/prometheus/procfs v0.0.0-20190507164030-5867b95ac084 // indirect
	github.com/spacemonkeygo/openssl v0.0.0-20181017203307-c2dcc5cca94a // indirect
	github.com/spacemonkeygo/spacelog v0.0.0-20180420211403-2296661a0572 // indirect
	github.com/spaolacci/murmur3 v1.1.0 // indirect
	github.com/whyrusleeping/base32 v0.0.0-20170828182744-c30ac30633cc // indirect
	github.com/whyrusleeping/cbor v0.0.0-20171005072247-63513f603b11 // indirect
	github.com/whyrusleeping/chunker v0.0.0-20181014151217-fe64bd25879f // indirect
	github.com/whyrusleeping/go-keyspace v0.0.0-20160322163242-5b898ac5add1 // indirect
	github.com/whyrusleeping/go-logging v0.0.0-20170515211332-0457bb6b88fc // indirect
	github.com/whyrusleeping/go-notifier v0.0.0-20170827234753-097c5d47330f // indirect
	github.com/whyrusleeping/mafmt v1.2.8 // indirect
	github.com/whyrusleeping/multiaddr-filter v0.0.0-20160516205228-e903e4adabd7 // indirect
	github.com/whyrusleeping/tar-utils v0.0.0-20180509141711-8c6c8ba81d5c // indirect
	github.com/whyrusleeping/timecache v0.0.0-20160911033111-cfcb2f1abfee // indirect
	go4.org v0.0.0-20190218023631-ce4c26f7be8e // indirect
	golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9 // indirect
	golang.org/x/image v0.0.0-20180708004352-c73c2afc3b81 // indirect
	golang.org/x/net v0.0.0-20201021035429-f5854403a974 // indirect
	golang.org/x/sync v0.0.0-20201020160332-67f06af15bc9 // indirect
	golang.org/x/sys v0.0.0-20200930185726-fdedc70b468f // indirect
	golang.org/x/text v0.3.3 // indirect
	golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1 // indirect
	google.golang.org/api v0.3.2 // indirect
	google.golang.org/genproto v0.0.0-20190307195333-5fe7a883aa19 // indirect
	google.golang.org/grpc v1.21.0 // indirect
)
