#!/usr/bin/env zsh

set -u
set -o pipefail

VERSION="1.17.2"

echo "=============== INSTALLING GOLANG ==============="
sleep 5

echo "=============== checking shell ==============="
if [ -z $GOROOT ]; then
    echo "Set 'GOROOT' and try again."
    exit 1
else
    echo "OKAY"
fi

echo "=============== checking current installation ==============="
if [ -e $(command -v go) ] &&
    [ $(go version | awk '/go/ {print $3}') = "go$VERSION" ]; then
    echo "Current installation up to date!"
    exit 0
fi

echo "=============== removing old install ==============="
rm -rf $GOROOT
echo "OKAY"


echo "=============== downloading archive ==============="
mkdir tmp
cd tmp
curl -L "https://golang.org/dl/go$VERSION.linux-amd64.tar.gz" -o go1.17.2.linux-amd64.tar.gz
echo "OKAY"


echo "=============== extracting archive ==============="
tar -C $XDG_DATA_HOME -xzf go1.17.2.linux-amd64.tar.gz
cd ..
rm -rf tmp
echo "OKAY"
go version
