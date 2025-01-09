package envconfig

import (
	"github.com/caarlos0/env/v11"
)

func ParseEnv[T any](cfg T) (T, error) {
	if err := env.Parse(cfg); err != nil {
		return cfg, err
	}

	return cfg, nil
}
