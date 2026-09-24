#!/bin/sh
# PWA本体（リポ直下）→ native/www へコピーする同期スクリプト
# 本体を編集したら、native/ で ./copy-www.sh && npx cap sync ios を実行
cd "$(dirname "$0")"
rm -rf www
mkdir -p www
for f in index.html manifest.json sw.js privacy.html icon.svg; do
  cp "../$f" www/
done
echo "copied $(ls www | wc -l | tr -d ' ') files to www/"
