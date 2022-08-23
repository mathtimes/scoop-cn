# Wood

![](https://github.com/duzyn/wood/workflows/Excavator/badge.svg)

Scoop 是一个很优秀的软件包管理工具，[官方的安装说明](https://scoop.sh/) 也简单易懂，但是在中国访问却可能在每个环节都会遇到无法下载的问题。

本源包含了 Scoop 官方的 main, extras, versions, java 四个源，并将国内访问缓慢的地址都替换成反代或镜像的地址，已加速下载。

另外也包含 Scoop 的安装脚本，用于初次下载安装 Scoop。

## 安装 Scoop

打开 PowerShell （ v5.1 或之后），输入以下命令：

	Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
	irm https://raw.fastgit.org/duzyn/wood/master/install.ps1 | iex
	
## 最先安装的几个 app

7zip 用来解压下载的压缩包，git 用来检出源，aria2 用来加速下载（可选）。

	scoop install https://raw.fastgit.org/duzyn/wood/master/bucket/7zip.json
	scoop install https://raw.fastgit.org/duzyn/wood/master/bucket/git.json
	scoop install https://raw.fastgit.org/duzyn/wood/master/bucket/aria2.json
	
## 替换 main 库

	scoop bucket rm main
	scoop bucket add main https://hub.fastgit.xyz/ScoopInstaller/Main

## 添加应用库

    scoop bucket add wood https://hub.fastgit.xyz/duzyn/wood

## 安装应用

    scoop install wood/<app_name>

## 更新应用库

    scoop update
