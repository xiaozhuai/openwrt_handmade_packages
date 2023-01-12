.PHONY: all wol-forwarder

.EXPORT_ALL_VARIABLES:
GO111MODULE = on
CGO_ENABLED = 0
GOOS = linux
GOARCH = amd64

all: wol-forwarder

wol-forwarder:
	@mkdir -p data/usr/bin/
	@cd wol-forwarder && go build -ldflags "-s -w" -a -o ../data/usr/bin/wol-forwarder .
