.PHONY: all supervisord

all: supervisord

supervisord:
	@echo "Build supervisord"
	@export GO111MODULE=on
	@export CGO_ENABLED=0
	@cd supervisord && go mod download && go build -tags release -ldflags "-s -w" -a -o supervisord
	@mkdir -p data/usr/bin/
	@cp -f supervisord/supervisord data/usr/bin/
