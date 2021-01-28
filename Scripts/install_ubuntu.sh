#!/usr/bin/env bash

echo "This script installs all needed dependencies to successfully run OpenCV on Ubuntu 20.04!"
echo "Run this script with sudo privileges in order to install the libraries"

if [[ $(whoami) != root ]]; then
  echo -e " -- \e[31mPlease run this script as root or using sudo\e[0m"
  exit
fi

echo -e " -- \e[33mFetching updates\e[0m"
apt update -qq

# While installing tzlib, it demands user interaction which stops the installation pipeline. This is a workaround
# to skip the user input section.
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

echo -e " -- \e[33mInstalling essential dependencies for OpenCV\e[0m"
apt install -y build-essential \
  clang \
  clang-format \
  clang-tidy \
  curl \
  wget \
  unzip \
  zip \
  cmake \
  python \
  python3 \
  python3-pip \
  python-dev \
  libusb-1.0-0-dev

echo -e " -- \e[33mInstalling optional dependencies for OpenCV\e[0m"
apt install -y \
  apt-get install -qq -y \
  libturbojpeg \
  libgtk-3-dev \
  libgtk2.0-dev \
  libavcodec-dev \
  libavformat-dev \
  libavutil-dev \
  libswscale-dev \
  libavresample-dev \
  libgstreamer-plugins-base1.0-dev \
  libdc1394-22-dev \
  libva-dev

echo -e " -- \e[33mCreating temp folder\e[0m"
mkdir temp && cd temp || exit

# As Python 2 is deprecated, this is needed to use pip for Python 2 on Ubuntu 20.04
echo -e " -- \e[33mInstalling Python2 dependencies\e[0m"
curl https://bootstrap.pypa.io/2.7/get-pip.py --output get-pip.py
python get-pip.py
python -m pip install numpy

echo -e " -- \e[33mDownloading Bazel 4.0.0\e[0m"

wget https://github.com/bazelbuild/bazel/releases/download/4.0.0/bazel_4.0.0-linux-x86_64.deb
wget https://github.com/bazelbuild/bazel/releases/download/4.0.0/bazel_4.0.0-linux-x86_64.deb.sha256
sha256sum -c bazel_4.0.0-linux-x86_64.deb.sha256

echo -e " -- \e[33mInstalling Bazel 4.0.0\e[0m"
dpkg -i bazel_4.0.0-linux-x86_64.deb

echo -e " -- \e[33mCleanup\e[0m"
cd .. && rm -rf temp || exit

echo -e " -- \e[33mSetup environment variables\e[0m"
# Add the lib folder to the linker library environment path
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

echo -e " -- \e[32mSetup completed successfully!\e[0m"
