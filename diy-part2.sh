#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.50.1/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# DIY part 2: 删除同名软件包 (如果存在)
rm -rf package/feeds/packages/luci-app-openclash

# add package openclash
git clone https://github.com/vernesong/OpenClash package/luci-app-openclash

# 这里可以直接修改.config文件或使用make defconfig等工具生成默认配置后再修改
echo 'CONFIG_PACKAGE_luci-app-openclash=y' >>.config
