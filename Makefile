include $(TOPDIR)/rules.mk

PKG_NAME:=telestonet
PKG_VERSION:=2024-07-29 # Or any dummy version
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/dtn7/dtn7-go.git
PKG_SOURCE_VERSION:=main
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_MIRROR_HASH:=skip

GO_PKG:=github.com/dtn7/dtn7-go
GO_BUILD_PKG:=github.com/dtn7/dtn7-go/cmd/dtnd github.com/dtn7/dtn7-go/cmd/dtnrecv github.com/dtn7/dtn7-go/cmd/dtnsend

PKG_LICENSE:=GPL-3.0-or-later
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=You <you@example.com>

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define Package/dtn7
  SECTION:=net
  CATEGORY:=Network
  TITLE:=DTN7 Bundle Protocol Daemon
  DEPENDS:=+libc
endef

define Package/dtn7/install
	$(INSTALL_DIR) $(1)/usr/bin
	[ -f $(GO_PKG_BUILD_BIN_DIR)/dtnd ] && $(INSTALL_BIN) $(GO_PKG_BUILD_BIN_DIR)/dtnd $(1)/usr/bin/ || true
	[ -f $(GO_PKG_BUILD_BIN_DIR)/dtnrecv ] && $(INSTALL_BIN) $(GO_PKG_BUILD_BIN_DIR)/dtnrecv $(1)/usr/bin/ || true
	[ -f $(GO_PKG_BUILD_BIN_DIR)/dtnsend ] && $(INSTALL_BIN) $(GO_PKG_BUILD_BIN_DIR)/dtnsend $(1)/usr/bin/ || true
endef

$(eval $(call BuildPackage,dtn7))

