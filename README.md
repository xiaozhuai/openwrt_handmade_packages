# openwrt_handmade_packages

一些手工构建的openwrt包，不需要openwrt源码环境或sdk即可编译。

通过github actions自动发布版本。

可以在release页面下载ipk包

## 应用

### dnsmasq-dhcp-boot

配置`dhcp-boot`以实现网络启动功能(ipxe)，主要用于配合群晖等nas使用。

配置文件 `/etc/dnsmasq_dhcp_boot.conf`

### lego

通过`lego`客户端实现acme自动获取ssl证书

在`/etc/lego/env`中配置计划任务，let's encrypt账号，验证方式等。

在`/etc/lego/domains`中添加域名，一行一个，注意文件最后必须保留一个空行。

在`/etc/lego/hooks`中添加`你的域名.sh`钩子脚本。

脚本接受3个参数，依次是：

1. `create|renew`, 用于标识是创建证书还是续期证书
2. 证书路径
3. 证书秘钥路径

示例钩子脚本位于`/etc/lego/hooks/default.sh`

### supervisord

go实现的`supervisord`, 在`/etc/supervisor.d`中添加配置文件

### wol-forwarder

网络启动魔术包转发, 配置`/etc/config/wol-forwarder`
