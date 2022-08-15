#!/bin/bash
tmp_dir="$(mktemp)" &&
YQ_VERSION=$(curl -I --silent https://github.com/mikefarah/yq/releases/latest | grep 'location: https'| sed 's/^.*tag\///g' | sed 's/>.*$//g' | sed 's/^v//'| tr -d '[:blank:]\r')
wget https://github.com/mikefarah/yq/releases/download/v$YQ_VERSION/yq_linux_amd64.tar.gz -q -O "$tmp_dir" && tar -xzvf "$tmp_dir" -C ./ &&
cp yq_linux_amd64 ~/.local/bin/yq &&
rm -f "$tmp_dir" "install-man-page.sh" "yq.1" "yq_linux_amd64"
