package ipfscluster

import (
	"encoding/json"
	"os"
	"testing"
	"time"
)

var ccfgTestJSON = []byte(`
{
        "peername": "testpeer",
        "secret": "2588b80d5cb05374fa142aed6cbb047d1f4ef8ef15e37eba68c65b9d30df67ed",
        "leave_on_shutdown": true,
        "connection_manager": {
             "high_water": 501,
             "low_water": 500,
             "grace_period": "100m0s"
        },
        "listen_multiaddress": "/ip4/127.0.0.1/tcp/10000",
        "state_sync_interval": "1m0s",
        "ipfs_sync_interval": "2m10s",
        "replication_factor_min": 5,
        "replication_factor_max": 5,
        "monitor_ping_interval": "2s",
        "disable_repinning": true
}
`)

func TestLoadJSON(t *testing.T) {
	loadJSON := func(t *testing.T) *Config {
		cfg := &Config{}
		err := cfg.LoadJSON(ccfgTestJSON)
		if err != nil {
			t.Fatal(err)
		}
		return cfg
	}

	t.Run("basic", func(t *testing.T) {
		cfg := &Config{}
		err := cfg.LoadJSON(ccfgTestJSON)
		if err != nil {
			t.Fatal(err)
		}
	})

	t.Run("peername", func(t *testing.T) {
		cfg := loadJSON(t)
		if cfg.Peername != "testpeer" {
			t.Error("expected peername 'testpeer'")
		}
	})

	t.Run("expected replication factor", func(t *testing.T) {
		cfg := loadJSON(t)
		if cfg.ReplicationFactorMin != 5 {
			t.Error("expected replication factor min == 5")
		}
	})

	t.Run("expected disable_repinning", func(t *testing.T) {
		cfg := loadJSON(t)
		if !cfg.DisableRepinning {
			t.Error("expected disable_repinning to be true")
		}
	})

	t.Run("expected connection_manager", func(t *testing.T) {
		cfg := loadJSON(t)
		if cfg.ConnMgr.LowWater != 500 {
			t.Error("expected low_water to be 500")
		}
		if cfg.ConnMgr.HighWater != 501 {
			t.Error("expected high_water to be 501")
		}
		if cfg.ConnMgr.GracePeriod != 100*time.Minute {
			t.Error("expected grace_period to be 100m")
		}
	})

	loadJSON2 := func(t *testing.T, f func(j *configJSON)) (*Config, error) {
		cfg := &Config{}
		j := &configJSON{}
		json.Unmarshal(ccfgTestJSON, j)
		f(j)
		tst, err := json.Marshal(j)
		if err != nil {
			return cfg, err
		}
		err = cfg.LoadJSON(tst)
		if err != nil {
			return cfg, err
		}
		return cfg, nil
	}

	t.Run("empty default peername", func(t *testing.T) {
		cfg, err := loadJSON2(t, func(j *configJSON) { j.Peername = "" })
		if err != nil {
			t.Error(err)
		}
		if cfg.Peername == "" {
			t.Error("expected default peername")
		}
	})

	t.Run("bad listen multiaddress", func(t *testing.T) {
		_, err := loadJSON2(t, func(j *configJSON) { j.ListenMultiaddress = "abc" })
		if err == nil {
			t.Error("expected error parsing listen_multiaddress")
		}
	})

	t.Run("bad secret", func(t *testing.T) {
		_, err := loadJSON2(t, func(j *configJSON) { j.Secret = "abc" })
		if err == nil {
			t.Error("expected error decoding secret")
		}
	})

	t.Run("default replication factors", func(t *testing.T) {
		cfg, err := loadJSON2(
			t,
			func(j *configJSON) {
				j.ReplicationFactorMin = 0
				j.ReplicationFactorMax = 0
			},
		)
		if err != nil {
			t.Error(err)
		}
		if cfg.ReplicationFactorMin != -1 || cfg.ReplicationFactorMax != -1 {
			t.Error("expected default replication factor")
		}
	})

	t.Run("only replication factor min set to -1", func(t *testing.T) {
		_, err := loadJSON2(t, func(j *configJSON) { j.ReplicationFactorMin = -1 })
		if err == nil {
			t.Error("expected error when only one replication factor is -1")
		}
	})

	t.Run("replication factor min > max", func(t *testing.T) {
		_, err := loadJSON2(
			t,
			func(j *configJSON) {
				j.ReplicationFactorMin = 5
				j.ReplicationFactorMax = 4
			},
		)
		if err == nil {
			t.Error("expected error when only rplMin > rplMax")
		}
	})

	t.Run("default replication factor", func(t *testing.T) {
		cfg, err := loadJSON2(
			t,
			func(j *configJSON) {
				j.ReplicationFactorMin = 0
				j.ReplicationFactorMax = 0
			},
		)
		if err != nil {
			t.Error(err)
		}
		if cfg.ReplicationFactorMin != -1 || cfg.ReplicationFactorMax != -1 {
			t.Error("expected default replication factors")
		}
	})

	t.Run("conn manager default", func(t *testing.T) {
		cfg, err := loadJSON2(
			t,
			func(j *configJSON) {
				j.ConnectionManager = nil
			},
		)
		if err != nil {
			t.Fatal(err)
		}
		if cfg.ConnMgr.LowWater != DefaultConnMgrLowWater {
			t.Error("default conn manager values not set")
		}
	})
}

func TestToJSON(t *testing.T) {
	cfg := &Config{}
	cfg.LoadJSON(ccfgTestJSON)
	newjson, err := cfg.ToJSON()
	if err != nil {
		t.Fatal(err)
	}
	cfg = &Config{}
	err = cfg.LoadJSON(newjson)
	if err != nil {
		t.Fatal(err)
	}
}

func TestDefault(t *testing.T) {
	cfg := &Config{}
	cfg.Default()
	if err := cfg.Validate(); err != nil {
		t.Fatal(err)
	}
}

func TestApplyEnvVars(t *testing.T) {
	os.Setenv("CLUSTER_PEERNAME", "envsetpeername")
	cfg := &Config{}
	cfg.Default()
	cfg.ApplyEnvVars()
	if cfg.Peername != "envsetpeername" {
		t.Fatal("failed to override peername with env var")
	}
}

func TestValidate(t *testing.T) {
	cfg := &Config{}

	cfg.Default()
	cfg.MonitorPingInterval = 0
	if cfg.Validate() == nil {
		t.Fatal("expected error validating")
	}

	cfg.Default()
	cfg.ReplicationFactorMin = 10
	cfg.ReplicationFactorMax = 5
	if cfg.Validate() == nil {
		t.Fatal("expected error validating")
	}

	cfg.Default()
	cfg.ReplicationFactorMin = 0
	if cfg.Validate() == nil {
		t.Fatal("expected error validating")
	}

	cfg.Default()
	cfg.ConnMgr.GracePeriod = 0
	if cfg.Validate() == nil {
		t.Fatal("expected error validating")
	}
}
