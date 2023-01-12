.PHONY: all lego

.EXPORT_ALL_VARIABLES:
GO111MODULE = on
CGO_ENABLED = 0
GOOS = linux
GOARCH = amd64

all: lego

lego:
	@mkdir -p data/usr/bin/
	@cd lego && go mod download && SHA="$(git rev-parse HEAD)" && go build -trimpath -ldflags '-X "main.version=${SHA}" -s -w' -o ../data/usr/bin/lego ./cmd/lego/
