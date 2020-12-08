#!/usr/bin/env bash

pacman -Qe | awk '{print $1}' > packages.txt

git add -A
git commit -m "update $(date | awk '{print $2,$3,$7}')"
git push origin master

echo "Done."
