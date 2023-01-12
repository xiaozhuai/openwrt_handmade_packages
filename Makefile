packages_dir=packages
dist_dir=dist

.PHONY: all help po2lmo dnsmasq-dhcp-boot lego supervisord wol-forwarder luci-app-aliddns

TOOLS_PATH := $(PWD)/tools
PATH := $(PATH):$(PWD)/tools

all: po2lmo dnsmasq-dhcp-boot lego supervisord wol-forwarder luci-app-aliddns

help:
	@echo "targets: dnsmasq-dhcp-boot lego supervisord wol-forwarder"

po2lmo:
	$(MAKE) -C host/po2lmo install PREFIX="$(PWD)/tools"

dnsmasq-dhcp-boot:
	@ipkify ${packages_dir}/$@ ${dist_dir}

lego:
	@ipkify ${packages_dir}/$@ ${dist_dir}

supervisord:
	@ipkify ${packages_dir}/$@ ${dist_dir}

wol-forwarder:
	@ipkify ${packages_dir}/$@ ${dist_dir}

luci-app-aliddns: po2lmo
	@ipkify ${packages_dir}/$@ ${dist_dir}
