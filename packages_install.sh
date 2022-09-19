#!/usr/bin/env bash

clear
echo "INSTALLING PACKAGES FOR EPITECH'S DUMP"
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
echo "Press ENTER to continue..."
read

apt upgrade -y

packages_list=(boost-devel
               boost-static
               ca-certificates.noarch
               clang
               cmake
               CUnit-devel
               curl
               flac-devel
               freetype-devel
               gcc
               gcc-c++
               gdb
               git
               glibc
               glibc-devel
               glibc-locale-source
               gmp-devel
               ksh
               elfutils-libelf-devel
               libjpeg-turbo-devel
               libvorbis-devel
               SDL2
               SDL2-static
               SDL2-devel
               libX11-devel
               libXext-devel
               ltrace
               make
               nasm
               ncurses
               ncurses-devel
               ncurses-libs
               net-tools
               openal-soft-devel
               python3-numpy
               python3
               rlwrap
               ruby
               strace
               tar
               tcsh
               tmux
               sudo
               tree
               unzip
               valgrind
               vim
               emacs-nox
               which
               xcb-util-image
               xcb-util-image-devel
               zip
               zsh
               avr-gcc
               qt-devel
               docker
               docker-compose
               java-17-openjdk
               java-17-openjdk-devel
               boost
               boost-math
               boost-graph
               autoconf
               automake
               tcpdump
               wireshark
               nodejs
               emacs-tuareg
               libvirt
               libvirt-devel
               virt-install
               haskell-platform
               golang
               systemd-devel
               libgudev-devel
               php
               php-devel
               php-bcmath
               php-cli
               php-gd
               php-mbstring
               php-mysqlnd
               php-pdo
               php-pear.noarch
               php-xml
               php-gettext-gettext.noarch
               php-phar-io-version.noarch
               php-theseer-tokenizer.noarch
               SFML
               SFML-devel
               CSFML
               CSFML-devel
               irrlicht
               irrlicht-devel
               rust
               cargo
               mariadb-server
               x264
               lightspark
               lightspark-mozilla-plugin
               teams)

apt -y install ${packages_list[@]}

# Criterion
curl -sSL "https://github.com/Snaipe/Criterion/releases/download/v2.4.0/criterion-2.4.0-linux-x86_64.tar.xz" -o criterion-2.4.0.tar.xz
tar xf criterion-2.4.0.tar.xz
cp -r criterion-2.4.0/* /usr/local/
echo "/usr/local/lib" > /etc/ld.so.conf.d/usr-local.conf
ldconfig
rm -rf criterion-2.4.0.tar.xz criterion-2.4.0/

# Sbt
curl -sSL "https://github.com/sbt/sbt/releases/download/v1.3.13/sbt-1.3.13.tgz" | tar xz
mv sbt /usr/local/share
ln -s '/usr/local/share/sbt/bin/sbt' '/usr/local/bin'

# Gradle
wget https://services.gradle.org/distributions/gradle-7.2-bin.zip
mkdir /opt/gradle && unzip -d /opt/gradle gradle-7.2-bin.zip && rm -f gradle-7.2-bin.zip
echo 'export PATH=$PATH:/opt/gradle/gradle-7.2/bin' >> /etc/profile

# Stack
curl -sSL https://get.haskellstack.org/ | sh

# CONFIG EMACS
git clone https://github.com/Epitech/epitech-emacs.git
cd epitech-emacs
git checkout 278bb6a630e6474f99028a8ee1a5c763e943d9a3
./INSTALL.sh system
cd .. && rm -rf epitech-emacs

# CONFIG VIM
git clone https://github.com/Epitech/vim-epitech.git
cd vim-epitech
git checkout ec936f2a49ca673901d56598e141932fd309ddac
./install.sh
cd .. && rm -rf vim-epitech
