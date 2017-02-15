#!/bin/sh
set -o errexit
set -o xtrace

export GOPATH=$HOME/go
echo "export GOPATH=$GOPATH" >> "$HOME/.profile"
echo "export PATH=$GOPATH/bin:$PATH" >> "$HOME/.profile"
mkdir -p $GOPATH
. "$HOME/.profile"
go get -d github.com/eris-ltd/eris/cmd/eris
cd $GOPATH/src/github.com/eris-ltd/eris
git checkout release-0.16
go install ./cmd/eris
export ERIS_PULL_APPROVE=true
eris init
docker pull tutum/logrotate
