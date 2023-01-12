.PHONY: all lego

all: lego

lego:
	@echo "Build lego"
	@export GO111MODULE=on
	@export CGO_ENABLED=0
	@cd lego && go mod download && SHA="$(git rev-parse HEAD)" && go build -trimpath -ldflags '-X "main.version=${SHA}" -s -w' -o dist/lego ./cmd/lego/
	@mkdir -p data/usr/bin/
	@cp -f lego/dist/lego data/usr/bin/
