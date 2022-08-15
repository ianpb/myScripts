#!/bin/bash
temp_deb="$(mktemp)" &&
Koodo_VERSION=$(curl -I --silent https://github.com/troyeguo/koodo-reader/releases/latest | grep 'location: https'| sed 's/^.*tag\///g' | sed 's/>.*$//g' | sed 's/^v//'| tr -d '[:blank:]\r')
wget https://github.com/troyeguo/koodo-reader/releases/download/v$Koodo_VERSION/Koodo.Reader-$Koodo_VERSION.deb -O "$temp_deb" -q && sudo dpkg -i "$temp_deb" 
rm -rf "$temp_deb"
