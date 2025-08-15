module("luci.controller.keepalived_ha", package.seeall)

function index()
    entry({"admin", "network", "keepalived_ha"}, cbi("keepalived_ha"), _("Keepalived 高可用"), 90)
    entry({"admin", "network", "keepalived_ha_log"}, template("keepalived_ha/log"), _("日志查看"), 91)
    entry({"admin", "network", "keepalived_ha_apply"}, call("apply_config"), _("应用配置"), 92)
end

function apply_config()
    luci.sys.call("/usr/libexec/keepalived_ha_apply.sh >/tmp/keepalived_ha_apply.log 2>&1")
    luci.http.redirect(luci.dispatcher.build_url("admin", "network", "keepalived_ha_log"))
end
