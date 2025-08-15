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
输出
```bash
Updating feed 'custom' from 'https://github.com/PlanetEditorX/luci-app-custom.git;main' ...
Already up to date.
Create index file './feeds/custom.index'
```

3. 安装
```bash
./scripts/feeds install luci-app-keepalived-ha
./scripts/feeds install -a
```
成功输出
```bash
Installing package 'luci-app-keepalived-ha' from custom
```

4. 编译
```bash
make package/luci-app-keepalived-ha/compile V=s
```


CONFIG_PACKAGE_luci-app-keepalived-ha=y