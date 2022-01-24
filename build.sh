#!/bin/sh

rm -rf Main scoop-extras Versions

git clone --depth=1  https://github.com/ScoopInstaller/Main
git clone --depth=1  https://github.com/lukesampson/scoop-extras
git clone --depth=1  https://github.com/ScoopInstaller/Versions

cp -rf Main/bucket/*         ./bucket
cp -rf scoop-extras/bucket/* ./bucket
cp -rf Versions/bucket/*     ./bucket

perl -pi -e 's/https\:\/\/github\.com\/(.+)\/releases\/download/https\:\/\/download\.fastgit\.org\/$1\/releases\/download/g' ./bucket/*.json

# latex
perl -pi -e 's/https\:\/\/miktex\.org\/download\/ctan/https\:\/\/mirrors\.aliyun\.com\/CTAN/g' ./bucket/latex.json

# nodejs
perl -pi -e 's/https\:\/\/nodejs\.org\/dist/https\:\/\/npm\.taobao\.org\/mirrors\/node/g' ./bucket/nodejs*.json

# vlc
perl -pi -e 's/https\:\/\/download\.videolan\.org\/pub/https\:\/\/mirrors\.ustc\.edu\.cn\/videolan\-ftp/g' ./bucket/vlc.json

# dbeaver
perl -pi -e 's/https\:\/\/download\.dbeaver\.com\/community/https\:\/\/download\.fastgit\.org\/dbeaver\/dbeaver\/releases\/download/g' ./bucket/dbeaver.json

# firefox
cp ./bucket/firefox.json ./bucket/firefox-zh-cn.json
perl -pi -e 's/en-US/zh-CN/g' ./bucket/firefox-zh-cn.json


rm -rf Main scoop-extras Versions
