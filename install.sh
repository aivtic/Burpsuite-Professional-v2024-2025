#!/bin/bash

# Step 1: Download and install JDK
echo 'Downloading and installing JDK...'
jdk_url="https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb"
wget $jdk_url -O jdk-21_linux-x64_bin.deb --quiet --show-progress
sudo dpkg -i jdk-21_linux-x64_bin.deb
sudo apt-get install -f -y  # Fix any missing dependencies


# Step 2: Download Burp Suite Professional Latest
echo 'Downloading Burp Suite Professional Latest...'
mkdir -p Burpsuite-Professional
cd Burpsuite-Professional
html=$(curl -s https://portswigger.net/burp/releases)
version=$(echo $html | grep -Po '(?<=/burp/releases/professional-community-)[0-9]+\-[0-9]+\-[0-9]+' | head -n 1)
link="https://portswigger-cdn.net/burp/releases/download?product=pro&type=Jar&version=$version"
echo "Version detected: $version"
wget "$link" -O burpsuite_pro_v$version.jar --quiet --show-progress

echo 'Download complete. Burp Suite Professional is ready.'
