#!/usr/bin/env bash

echo "This script installs all needed dependencies to successfully run OpenCV on Manjaro!"
echo "Run this script with sudo privileges in order to install the libraries"

if [[ $(whoami) != root ]]; then
  echo -e " -- \e[31mPlease run this script as root or using sudo\e[0m"
  exit
fi

if ! command -v yay &>/dev/null; then
  echo -e " -- \e[31mPlease install YAY package manager for Manjaro.\e[0m"
  exit
fi

yay -S --noconfirm base-devel cmake git gtk2 pkgconf ffmpeg

echo -e " -- \e[33mDownloading Bazel 4.0.0\e[0m"
mkdir temp && cd temp || exit
wget https://github.com/bazelbuild/bazel/releases/download/4.0.0/bazel_4.0.0-linux-x86_64.deb
wget https://github.com/bazelbuild/bazel/releases/download/4.0.0/bazel_4.0.0-linux-x86_64.deb.sha256
sha256sum -c bazel_4.0.0-linux-x86_64.deb.sha256

echo -e " -- \e[33mInstalling Bazel 3.6.0\e[0m"
dpkg -i bazel_4.0.0-linux-x86_64.deb

echo -e " -- \e[33mCleanup\e[0m"
cd .. && rm -rf temp

echo -e " -- \e[32mSetup completed successfully!\e[0m"