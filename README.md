# 3D-Touch-Demo

友情链接： https://github.com/chaiweiwei/3D-Touch-Demo.git

PS：在作者的描述下写了一个3D Touch 超级简单的入门demo

simulator: 模拟器不支持3D touch,可以安装插件 PS：https://github.com/DeskConnect/SBShortcutMenuSimulator

安装步骤：

1. Xcode安装插件

``` C++
git clone https://github.com/DeskConnect/SBShortcutMenuSimulator.git
cd SBShortcutMenuSimulator
make
```

2. 模拟器安装

终端命令：

``` C++
xcrun simctl spawn booted launchctl debug system/com.apple.SpringBoard --environment DYLD_INSERT_LIBRARIES=$PWD/SBShortcutMenuSimulator.dylib
xcrun simctl spawn booted launchctl stop com.apple.SpringBoard
```
3. 3D Touch 效果

其中`com.apple.mobilecal`是项目的Bundle identifier

``` C++
echo 'com.apple.mobilecal' | nc 127.0.0.1 8000
```

