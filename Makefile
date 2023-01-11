packages_dir=packages
dist_dir=dist

all: wol-forwarder supervisord dnsmasq-dhcp-boot lego

help:
	@echo "targets: wol-forwarder supervisord dnsmasq-dhcp-boot lego"

wol-forwarder:
	@./build.sh ${packages_dir}/$@ ${dist_dir}

supervisord:
	@./build.sh ${packages_dir}/$@ ${dist_dir}

dnsmasq-dhcp-boot:
	@./build.sh ${packages_dir}/$@ ${dist_dir}

lego:
	@./build.sh ${packages_dir}/$@ ${dist_dir}
