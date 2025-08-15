m = Map("keepalived_ha", "Keepalived 高可用配置")

s = m:section(NamedSection, "config", "keepalived_ha", "基本参数")

role = s:option(ListValue, "role", "路由角色")
role:value("main", "主路由")
role:value("peer", "旁路由")

s:option(Value, "vip", "虚拟 IP")
s:option(Value, "interface", "接口名")
s:option(Value, "peer_ip", "对端 IP")

return m
