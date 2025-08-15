include $(TOPDIR)/feeds/luci/luci.mk

LUCI_TITLE:=LuCI Support for Keepalived HA
LUCI_DEPENDS:=+keepalived +nftables +luci-base
LUCI_PKGARCH:=all
LUCI_LICENSE:=MIT
LUCI_MAINTAINER:=PlanetEditorX

define Package/luci-app-keepalived-ha
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=LuCI Support for Keepalived HA
	MAINTAINER:=PlanetEditorX
	DEPENDS:=+luci-base +keepalived
endef

define Package/luci-app-keepalived-ha/install
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

$(eval $(call BuildPackage,luci-app-keepalived-ha))
