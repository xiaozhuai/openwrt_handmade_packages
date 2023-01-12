all: wol-forwarder

wol-forwarder:
	@echo "Clone https://github.com/xiaozhuai/docker-wol-forwarder"
	@rm -rf docker-wol-forwarder
	@git clone --depth=1 "https://github.com/xiaozhuai/docker-wol-forwarder"
	@echo "Build wol-forwarder"
	@export GO111MODULE=on
	@export CGO_ENABLED=0
	@cd docker-wol-forwarder && go build -ldflags "-s -w" -a -o wol-forwarder .
	@cp -f docker-wol-forwarder/wol-forwarder data/usr/bin/
	@rm -rf docker-wol-forwarder
