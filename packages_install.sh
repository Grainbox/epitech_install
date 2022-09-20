#!/usr/bin/env bash

clear
echo "INSTALLING PACKAGES FOR EPITECH'S DUMP"
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
echo "Press ENTER to continue..."
read
echo "Enter your default Linux Username"
read -r username


apt update -y
apt upgrade -y
apt update -y

packages_list=(libboost-all-dev
               apt-transport-https
               ca-certificates
               cmake
               curl
               gcc
               g++
               gdb
               git
               glibc-source
               ltrace
               make
               libncurses5-dev
               libncursesw5-dev
               net-tools
               python3-numpy
               python3
               ruby
               strace
               tar
               csh
               tmux
               sudo
               tree
               unzip
               valgrind
               vim
               emacs
               zip
               zsh
               openjdk-17-jdk
               openjdk-17-jre
               autoconf
               automake
               tcpdump
               wireshark
               nodejs
               golang
               libsfml-dev
               php
               php-cli
               php-mbstring
               php-mysqlnd
               php-pdo
               php-xml)

apt -y install ${packages_list[@]}

# CSFML
curl "https://raw.githubusercontent.com/Grainbox/epitech_install/main/install_csfml.sh?token=GHSAT0AAAAAABYNEAXYILC6SBY2URUAFUSIYZIQHXQ" | bash

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

# DOCKER
apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu `lsb_release -cs` test"
apt update
apt install docker-ce

# OH-MY-ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh $username /usr/bin/zsh

echo DONE
