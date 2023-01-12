all: lego

lego:
	@echo "Clone https://github.com/go-acme/lego"
	@rm -rf lego
	@git clone --depth=1 "https://github.com/go-acme/lego"
	@echo "Build lego"
	@export GO111MODULE=on
	@export CGO_ENABLED=0
	@cd lego && go mod download && SHA="$(git rev-parse HEAD)" && go build -trimpath -ldflags '-X "main.version=${SHA}" -s -w' -o dist/lego ./cmd/lego/
	@cp -f lego/dist/lego data/usr/bin/
	@rm -rf lego
