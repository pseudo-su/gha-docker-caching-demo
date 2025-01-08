package internal

import "github.com/pseudo-su/gha-docker-caching-demo/modules/service-pkg/envconfig"

type WorkerConfig struct {
	App      envconfig.AppConfig      `envPrefix:"APP_"`
	Tcp      envconfig.TcpConfig      `envPrefix:"TCP_"`
	Log      envconfig.LogConfig      `envPrefix:"LOG_"`
	Idp      envconfig.IdpConfig      `envPrefix:"IDP_"`
	Temporal envconfig.TemporalConfig `envPrefix:"TEMPORAL_"`
}

func (mc *WorkerConfig) LogConfig() envconfig.LogConfig {
	return mc.Log
}
