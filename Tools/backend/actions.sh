#!/bin/bash

packwiz="../../Tools/backend/packwiz.exe"

for dir in $version; do
  if [[ -d $dir ]]; then
    cd "$dir"
    $packwiz modrinth export
    $packwiz curseforge export
    break
  fi
done
