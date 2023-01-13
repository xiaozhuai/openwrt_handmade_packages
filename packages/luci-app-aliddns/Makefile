.PHONY: all luci-app-aliddns

all: luci-app-aliddns

luci-app-aliddns:
	@rm -rf data
	@mkdir -p data
	@cp -rf luci-app-aliddns/files/root/* data/
	@chmod 755 data/usr/sbin/aliddns
	@chmod 755 data/etc/init.d/*
	@chmod 755 data/etc/uci-defaults/*
	@mkdir -p data/usr/lib/lua
	@cp -rf luci-app-aliddns/files/luci data/usr/lib/lua/
	@mkdir -p data/usr/lib/lua/luci/model/cbi/aliddns
	@[ -d data/usr/lib/lua/luci/i18n ] && po2lmo_all -c -i data/usr/lib/lua/luci/i18n
