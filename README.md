# openwrt_handmade_packages

一些手工构建的openwrt包，不需要openwrt源码环境或sdk即可编译。

通过github actions自动发布版本。

可以在release页面下载ipk包

## QA

### 为什么要made by hand而不是从OpenWRT源码或SDK构建？

因为源码环境太重了，即使是SDK也太复杂，此项目创建了一个足够轻量的OpenWRT包构建环境。

Keep simple and stupid.

### 为什么某些包安装后找不到任何页面？

因为部分包本身就不支持用户界面，例如: `supervisord`，这些包更适合专业人员而不是小白用户。

## 应用

### dnsmasq-dhcp-boot

配置`dhcp-boot`以实现网络启动功能(ipxe)，主要用于配合群晖等nas使用。

配置文件 `/etc/dnsmasq_dhcp_boot.conf`

### lego

通过`lego`客户端实现acme自动获取ssl证书

在`/etc/lego/env`中配置计划任务，Let's Encrypt 账号邮箱，验证方式等。

在`/etc/lego/domains`中添加域名，一行一个，注意文件最后必须保留一个空行。

在`/etc/lego/hooks`中添加`你的域名.sh`钩子脚本。(如果是通配符域名，请将钩子脚本文件名中的`*`改为`_`)

脚本接受3个参数，依次是：

1. `create|renew`, 用于标识是创建证书还是续期证书
2. 证书路径
3. 证书秘钥路径

示例钩子脚本位于`/etc/lego/hooks/default.sh`

### luci-app-aliddns

来源于 [honwen/luci-app-aliddns](https://github.com/honwen/luci-app-aliddns)

无任何修改，仅仅是使其支持handmade集成编译

### supervisord

go实现的`supervisord`, 在`/etc/supervisor.d`中添加配置文件

### wol-forwarder

WOL远程开机魔术包转发, 配置`/etc/config/wol-forwarder`

