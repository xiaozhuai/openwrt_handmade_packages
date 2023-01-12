all: supervisord

supervisord:
	@echo "Clone https://github.com/ochinchina/supervisord"
	@rm -rf supervisord
	@git clone --depth=1 "https://github.com/ochinchina/supervisord"
	@echo "Build supervisord"
	@export GO111MODULE=on
	@export CGO_ENABLED=0
	@cd supervisord && go mod download && go build -tags release -ldflags "-s -w" -a -o supervisord
	@cp -f supervisord/supervisord data/usr/bin/
	@rm -rf supervisord
