.PHONY: all supervisord

.EXPORT_ALL_VARIABLES:
GO111MODULE = on
CGO_ENABLED = 0
GOOS = linux
GOARCH = amd64

all: supervisord

supervisord:
	@mkdir -p data/usr/bin/
	@cd supervisord && go mod download && go build -tags release -ldflags "-s -w" -a -o ../data/usr/bin/supervisord

clean:
	@rm -f ../data/usr/bin/supervisord
