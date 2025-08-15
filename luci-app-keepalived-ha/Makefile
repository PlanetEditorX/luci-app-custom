include $(TOPDIR)/include/package.mk

PKG_NAME:=luci-app-keepalived-ha
PKG_VERSION:=1.0.0
PKG_RELEASE:=1
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)
PKG_BUILD_TYPE:=none

define Package/$(PKG_NAME)
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI Support for Keepalived HA
  MAINTAINER:=PlanetEditorX
  DEPENDS:=+keepalived +nftables +luci-base
endef

define Package/$(PKG_NAME)/install
    $(INSTALL_DIR) $(1)/etc/config
    $(INSTALL_CONF) files/etc/config/keepalived_ha $(1)/etc/config/keepalived_ha

    $(INSTALL_DIR) $(1)/usr/libexec
    $(INSTALL_BIN) files/usr/libexec/keepalived_ha_apply.sh $(1)/usr/libexec/

    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
    $(INSTALL_DATA) luasrc/controller/keepalived_ha.lua $(1)/usr/lib/lua/luci/controller/

    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
    $(INSTALL_DATA) luasrc/model/cbi/keepalived_ha.lua $(1)/usr/lib/lua/luci/model/cbi/

    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/keepalived_ha
    $(INSTALL_DATA) luasrc/view/keepalived_ha/log.htm $(1)/usr/lib/lua/luci/view/keepalived_ha/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
