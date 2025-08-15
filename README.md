# 自用包

## luci-app-keepalived-ha
> 管理keepalived
1. 在根目录的`feeds.conf.default`添加
```bash
src-git custom https://github.com/PlanetEditorX/luci-app-custom.git;main
```
2. 更新
```bash
./scripts/feeds update custom
```

3. 安装
```bash
./scripts/feeds install luci-app-keepalived-ha
```
成功输出
```bash
Installing package 'luci-app-keepalived-ha' from custom
```