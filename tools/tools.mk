tools/device-info.cfg: tools/device-info.sh
	./tools/device-info.sh > tools/device-info.cfg

tools/actionlint: tools/tools.cfg
	. ./tools/tools.cfg && env GOBIN=$${PWD}/tools go install github.com/rhysd/actionlint/cmd/actionlint@v$${actionlint}

tools/editorconfig-checker: tools/tools.cfg
	. ./tools/tools.cfg && env GOBIN=$${PWD}/tools go install github.com/editorconfig-checker/editorconfig-checker/v2/cmd/editorconfig-checker@latest
	# . ./tools/tools.cfg && env GOBIN=$${PWD}/tools GOPROXY=direct go install github.com/editorconfig-checker/editorconfig-checker/v2/cmd/editorconfig-checker@$${editorconfig_checker}
