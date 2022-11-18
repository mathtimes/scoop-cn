rm -r bucket scripts
mkdir -p bucket scripts
cp -r Main/bucket/*               ./bucket
cp -r Main/scripts/*              ./scripts
cp -r Extras/bucket/*             ./bucket
cp -r Extras/scripts/*            ./scripts
cp -r Versions/bucket/*           ./bucket
cp -r Versions/scripts/*          ./scripts
cp -r scoop-nirsoft/bucket/*      ./bucket
cp -r PHP/bucket/*                ./bucket
cp -r scoop-nerd-fonts/bucket/*   ./bucket
cp -r Nonportable/bucket/*        ./bucket
cp -r Nonportable/scripts/*       ./scripts
cp -r Java/bucket/*               ./bucket
cp -r scoop-games/bucket/*        ./bucket
rm -r Main \
      Extras \
      Versions \
      scoop-nirsoft \
      PHP \
      scoop-nerd-fonts \
      Nonportable \
      Java \
      scoop-games

# GitHub Release
perl -pi -e 's/github\.com\/(.+)\/releases\/download/ghproxy\.com\/github\.com\/$1\/releases\/download/g' ./bucket/*.json

# GitHub Raw
perl -pi -e 's/raw\.githubusercontent\.com/ghproxy\.com\/raw\.githubusercontent\.com/g' ./bucket/*.json
perl -pi -e 's/github\.com\/(.+)\/raw/ghproxy\.com\/github\.com\/$1\/raw/g' ./bucket/*.json

# 7-Zip
perl -pi -e 's/www\.7-zip\.org\/a/experiments-alicdn\.sparanoid\.net\/7z/g' ./bucket/7zip.json

# LaTeX, MiKTeX
perl -pi -e 's/miktex\.org\/download\/ctan/mirrors\.aliyun\.com\/CTAN/g' ./bucket/{latex,miktex}.json

# Node
perl -pi -e 's/nodejs\.org\/dist/npm\.taobao\.org\/mirrors\/node/g' ./bucket/nodejs*.json

# VLC
perl -pi -e 's/download\.videolan\.org\/pub/mirrors\.ustc\.edu\.cn\/videolan-ftp/g' ./bucket/vlc.json

# DBeaver
perl -pi -e 's/download\.dbeaver\.com\/community/ghproxy\.com\/github\.com\/dbeaver\/dbeaver\/releases\/download/g' ./bucket/dbeaver.json

# OBS Studio
perl -pi -e 's/cdn-fastly\.obsproject\.com\/downloads\/OBS-Studio-(.+)-Full/ghproxy\.com\/github\.com\/obsproject\/obs-studio\/releases\/download\/$1\/OBS-Studio-$1-Full/g' ./bucket/obs-studio{,27}.json

# Tor Browser
perl -pi -e 's/dist\.torproject\.org\/torbrowser\/(.+)\/torbrowser-install-win64-/ghproxy\.com\/github\.com\/TheTorProject\/gettorbrowser\/releases\/download\/win64-$1\/torbrowser-install-win64-/g' ./bucket/tor-browser.json
perl -pi -e 's/dist\.torproject\.org\/torbrowser\/(.+)\/torbrowser-install-/ghproxy\.com\/github\.com\/TheTorProject\/gettorbrowser\/releases\/download\/win32-$1\/torbrowser-install-/g' ./bucket/tor-browser.json

# install.ps1
curl https://raw.githubusercontent.com/scoopinstaller/install/master/install.ps1 | perl -pi -e 's/\"https:\/\/github\.com/\"https:\/\/ghproxy\.com\/github\.com/g' > ./install.ps1

git config user.name github-actions
git config user.email github-actions@github.com
git add .
git commit -m 'Updated $(date "+%Y-%m-%d")'
git push
