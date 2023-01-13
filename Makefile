packages_dir=packages
dist_dir=dist

TOOLS_PATH := $(PWD)/tools
PATH := $(PATH):$(PWD)/tools

.PHONY: all clean po2lmo dnsmasq-dhcp-boot lego luci-app-aliddns supervisord wol-forwarder

all: po2lmo dnsmasq-dhcp-boot lego luci-app-aliddns supervisord wol-forwarder

clean:
	@rm -f ${dist_dir}/*.ipk
	@make -C host/po2lmo clean
	@make -C packages/dnsmasq-dhcp-boot clean
	@make -C packages/lego clean
	@make -C packages/luci-app-aliddns clean
	@make -C packages/supervisord clean
	@make -C packages/wol-forwarder clean

po2lmo:
	@$(MAKE) -C host/po2lmo install PREFIX="$(PWD)/tools"

dnsmasq-dhcp-boot:
	@ipkify ${packages_dir}/$@ ${dist_dir}

lego:
	@ipkify ${packages_dir}/$@ ${dist_dir}

luci-app-aliddns: po2lmo
	@ipkify ${packages_dir}/$@ ${dist_dir}

supervisord:
	@ipkify ${packages_dir}/$@ ${dist_dir}

wol-forwarder:
	@ipkify ${packages_dir}/$@ ${dist_dir}
