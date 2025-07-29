include $(TOPDIR)/rules.mk

PKG_NAME:=telestonet
PKG_VERSION:=2024-07-29
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/dtn7/dtn7-go.git
PKG_SOURCE_VERSION:=main
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/telestonet
  SECTION:=net
  CATEGORY:=Network
  TITLE:=DTN7 node
  DEPENDS:=+libc
endef

define Package/telestonet/description
  DTN7 Delay Tolerant Networking node daemon
endef

# Override build steps
define Build/Compile
	# This is a Go project!
	(cd $(PKG_BUILD_DIR)/cmd/dtnd; \
		GOOS=linux GOARCH=$(GO_ARCH) \
		$(HOST_GO_CMD) build -o $(PKG_BUILD_DIR)/dtnd . )
endef

define Package/telestonet/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/dtnd $(1)/usr/bin/
endef

$(eval $(call BuildPackage,telestonet))
