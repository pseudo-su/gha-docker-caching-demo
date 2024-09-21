### Dependencies - manage project and tool dependencies

## Install dependencies
deps.install: deps.tools.install deps.app.install
.PHONY: deps.install

## Update dependencies
deps.update: deps.tools.update deps.app.update
.PHONY: deps.update

## Tidy dependencies
deps.tidy: deps.tools.tidy deps.app.tidy
.PHONY: deps.tidy

## Install app dependencies
deps.app.install:
.PHONY: deps.app.install

## Update app dependencies
deps.app.update:
.PHONY: deps.app.update

## Tidy app dependencies
deps.app.tidy:
.PHONY: deps.app.tidy

## Install tool dependencies
deps.tools.install: \
	tools/actionlint \
	tools/editorconfig-checker
.PHONY: deps.tools.install

## Update tool dependencies
deps.tools.update: deps.tools.install
	@echo "WARNING: Any tool dependencies need to be updated manually"
.PHONY: deps.tools.update

## Tidy tool dependencies
deps.tools.tidy:
	@echo "WARNING: Any tool dependencies need to be tidied manually"
.PHONY: deps.tools.tidy

deps.tools.clean:
	git clean -f -x "./tools/*"
.PHONY: deps.tools.clean

### Verify - Code verifiation and Static analysis

## Run code verification
verify: verify.editorconfig verify.github-actions
.PHONY: verify

## Run code verifiation and automatically apply fixes where possible
verify.fix: verify.editorconfig verify.github-actions
.PHONY: verify.fix

# Run static analysis on .editorconfig rules
verify.editorconfig:
	./tools/editorconfig-checker
.PHONY: verify.editorconfig

## Verify using temporal workflow static analysis
verify.github-actions:
	./tools/actionlint -shellcheck=
.PHONY: verify.github-actionlint

## Verify empty commit diff after codegen
verify.empty-git-diff:
	./scripts/verify-empty-git-diff.sh
.PHONY: verify.empty-git-diff
