packages_dir=packages
dist_dir=dist

.PHONY: all help dnsmasq-dhcp-boot lego supervisord wol-forwarder

all: dnsmasq-dhcp-boot lego supervisord wol-forwarder

help:
	@echo "targets: dnsmasq-dhcp-boot lego supervisord wol-forwarder"

dnsmasq-dhcp-boot:
	@./build.sh ${packages_dir}/$@ ${dist_dir}

lego:
	@./build.sh ${packages_dir}/$@ ${dist_dir}

supervisord:
	@./build.sh ${packages_dir}/$@ ${dist_dir}

wol-forwarder:
	@./build.sh ${packages_dir}/$@ ${dist_dir}

