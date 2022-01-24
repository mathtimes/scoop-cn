#!/bin/sh

rm -rf Main scoop-extras Versions

git clone --depth=1  https://github.com/ScoopInstaller/Main
git clone --depth=1  https://github.com/lukesampson/scoop-extras
git clone --depth=1  https://github.com/ScoopInstaller/Versions

cp -rf Main/bucket/*         ./bucket
cp -rf scoop-extras/bucket/* ./bucket
cp -rf Versions/bucket/*     ./bucket

perl -pi -e 's/https\:\/\/github\.com\/(.+)\/releases\/download/https\:\/\/download\.fastgit\.org\/$1\/releases\/download/g' ./bucket/*.json

perl -pi -e 's/https\:\/\/miktex\.org\/download\/ctan/https\:\/\/mirrors\.aliyun\.com\/CTAN/g' ./bucket/latex.json

perl -pi -e 's/https\:\/\/nodejs\.org\/dist/https\:\/\/npm\.taobao\.org\/mirrors\/node/g' ./bucket/nodejs*.json

rm -rf Main scoop-extras Versions
