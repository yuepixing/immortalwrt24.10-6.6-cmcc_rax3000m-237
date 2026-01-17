#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
FIRMWARE_NAME="EasyWrt"
sudo apt install libfuse-dev
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang
sed -i "s/VERSION_DIST:=.*/VERSION_DIST:=${FIRMWARE_NAME}/" include/version.mk
sed -i "s/VERSION_CODE:=.*/VERSION_CODE:= By Yiying/" include/version.mk
sed -i "s/hostname='.*'/hostname='${FIRMWARE_NAME}'/g" package/base-files/files/bin/config_generate
sed -i "s/ImmortalWrt-2.4G/${FIRMWARE_NAME}-2.4G/g" package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i "s/ImmortalWrt-5G/${FIRMWARE_NAME}-5G/g" package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i "s/luci-theme-bootstrap/luci-theme-argon/g" feeds/luci/collections/luci/Makefile
./scripts/feeds update -a
./scripts/feeds install -a
