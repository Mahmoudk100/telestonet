#
# Copyright (C) 2024 Telestonet
# Distributed under the terms of the GNU General Public License v2
#

include $(TOPDIR)/rules.mk

PKG_NAME:=dtn7
PKG_VERSION:=0.20.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/dtn7/dtn7-go.git
PKG_SOURCE_VERSION:=v0.20.1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/dtn7
  SECTION:=net
  CATEGORY:=Network
  TITLE:=DTN7 Bundle Protocol Node
  URL:=https://github.com/dtn7/dtn7-go
  DEPENDS:=+libstdcpp +libpthread
endef

define Package/dtn7/description
  DTN7 is an implementation of the Delay Tolerant Networking Bundle Protocol (BPv7).
  This package provides the DTN7 command-line node.
endef

define Build/Compile
	$(call Build/Compile/Default)
endef

define Package/dtn7/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dtn7 $(1)/usr/bin/
endef

$(eval $(call BuildPackage,dtn7))
