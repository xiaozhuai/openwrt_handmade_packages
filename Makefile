packages_dir=packages
dist_dir=dist

.PHONY: all help po2lmo dnsmasq-dhcp-boot lego supervisord wol-forwarder

all: po2lmo dnsmasq-dhcp-boot lego supervisord wol-forwarder

help:
	@echo "targets: dnsmasq-dhcp-boot lego supervisord wol-forwarder"

po2lmo:
	$(MAKE) -C host/po2lmo install

dnsmasq-dhcp-boot:
	@./build.sh ${packages_dir}/$@ ${dist_dir}

lego:
	@./build.sh ${packages_dir}/$@ ${dist_dir}

supervisord:
	@./build.sh ${packages_dir}/$@ ${dist_dir}

wol-forwarder:
	@./build.sh ${packages_dir}/$@ ${dist_dir}
