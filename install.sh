#!/bin/bash


# Download Burpsuite Professional Latest.
    echo 'Downloading Burpsuite Professional Latest...'
    cd Burpsuite-Professional
    html=$(curl -s https://portswigger.net/burp/releases)
    version=$(echo $html | grep -Po '(?<=/burp/releases/professional-community-)[0-9]+\-[0-9]+\-[0-9]+' | head -n 1)
    Link="https://portswigger-cdn.net/burp/releases/download?product=pro&type=Jar&version=&"
    echo $version
    wget "$Link" -O burpsuite_pro_v$version.jar --quiet --show-progress

