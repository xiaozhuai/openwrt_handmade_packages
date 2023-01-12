.PHONY: all wol-forwarder

all: wol-forwarder

wol-forwarder:
	@echo "Build wol-forwarder"
	@export GO111MODULE=on
	@export CGO_ENABLED=0
	@mkdir -p data/usr/bin/
	@cd wol-forwarder && go build -ldflags "-s -w" -a -o ../data/usr/bin/wol-forwarder .
