# Scoop 应用库中国加速

## Scoop

Scoop 是一个很优秀的软件包管理工具，官方的安装说明也简单易懂，但是在中国访问却可能在每个环节都会遇到无法下载的问题。依次会遇到的是：

1. 首先从 GitHub Raw 下载 [Scoop 安装脚本](https://raw.githubusercontent.com/duzyn/wood/master/install.ps1)，此时下载会失败。
2. 如果第一步成功后，会下载 [Scoop 仓库存档](https://github.com/ScoopInstaller/Scoop/archive/master.zip) 和 [Main 应用仓库存档](https://github.com/ScoopInstaller/Main/archive/master.zip)，此时下载又会失败。
3. 如果第二步成功后，会先下载 7-Zip 和 Git 来做后面的事，因为 [7-Zip 的官网](https://www.7-zip.org/) 也是会偶尔无法访问，Git 下载地址在 [GitHub Release](https://github.com/git-for-windows/git/releases)，此时下载又会失败
4. 如果第三步成功后，会从官方 Main 应用仓库检出代码，地址在 [GitHub 仓库](https://github.com/ScoopInstaller/Main)，此时下载又会失败
5. 如果第四步成功后，更新 Scoop 时会从官方 Scoop 仓库检出代码，地址在 [GitHub 仓库](https://github.com/ScoopInstaller/Scoop/)，此时下载又会失败
6. 后续添加、检出 extra 等应用仓库都会失败

如果你使用 Scoop 没有遇到这些问题，恭喜你，后面的内容不用看了。

## 本应用库介绍

本应用库包含 Scoop 的安装脚本，用于国内用户初次下载安装 Scoop。同时包含了 Scoop 官方的九个应用库，main、extras、versions、nirsoft、php、nerd-fonts、nonportable、java、games（使用命令 `scoop bucket known` 查看），用一个库包含了各家的库，用户不用在多个地方搜索应用。

## 前提条件

[PowerShell](https://learn.microsoft.com/zh-cn/powershell/) 版本在 5.1 或以上，如果没有 PowerShell 大于 5.1 版本，可以下载安装 [PowerShell Core](https://github.com/PowerShell/PowerShell)。运行以下命令查看：

```powershell
$psversiontable.psversion.major # should be >= 5.1
```

其次，允许本地运行 PowerShell 脚本，以管理员打开 PowerShell，运行以下命令，回答 Y：
  
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## 安装 Scoop

打开 PowerShell，输入以下命令下载安装 Scoop：

```powershell
irm https://ghproxy.com/raw.githubusercontent.com/duzyn/scoop-cn/master/install.ps1 | iex
```

或者使用 [jsdelivr](https://www.jsdelivr.com/) CDN 的地址：

```powershell
irm https://cdn.jsdelivr.net/gh/duzyn/scoop-cn/install.ps1 | iex
```

## 最先安装的几个 app

要下载 app，需要先下载几个 app。这几个 app 用官方应用库下载很慢，所以也使用代理后的地址下载。7-Zip 用来解压下载的压缩包，Git 用来检出应用库，Aria2 用来加速下载（可选）。

```powershell
scoop install https://ghproxy.com/raw.githubusercontent.com/duzyn/scoop-cn/master/bucket/7zip.json
scoop install https://ghproxy.com/raw.githubusercontent.com/duzyn/scoop-cn/master/bucket/git.json
scoop install https://ghproxy.com/raw.githubusercontent.com/duzyn/scoop-cn/master/bucket/aria2.json
```

或者使用 [jsdelivr](https://www.jsdelivr.com/) CDN 的地址：

```powershell
scoop install https://cdn.jsdelivr.net/gh/duzyn/scoop-cn/bucket/7zip.json
scoop install https://cdn.jsdelivr.net/gh/duzyn/scoop-cn/bucket/git.json
scoop install https://cdn.jsdelivr.net/gh/duzyn/scoop-cn/bucket/aria2.json
```

## 替换 Scoop 仓库

把原来的 Scoop 仓库的地址换为代理后的地址。

```powershell
scoop config SCOOP_REPO https://ghproxy.com/github.com/ScoopInstaller/Scoop
```

## 替换 Main 库

先删除原来的 Main 库，再添加新的代理后的 Main 库。

```powershell
scoop bucket rm main
scoop bucket add main https://ghproxy.com/github.com/ScoopInstaller/Main
```

## 添加应用库

添加本应用库。

```powershell
scoop bucket add scoop-cn https://ghproxy.com/github.com/duzyn/scoop-cn
```

## 安装应用

```powershell
scoop install scoop-cn/APPNAME
```

## 查看帮助

要了解 Scoop 的更多用法，请查看 [Scoop 官网](https://scoop.sh/)

```powershell
scoop help
```

## 安全

本应用库使用的是 [GitHub Proxy](https://ghproxy.com/) 和 GitHub Actions。

## 类似项目

[homebrew-cn](https://github.com/duzyn/homebrew-cn)