#!/bin/bash
export GOPATH=$HOME/go
echo "export GOPATH=$GOPATH" >> "$HOME/.profile"
echo "export PATH=$GOPATH/bin:$PATH" >> "$HOME/.profile"
mkdir -p $GOPATH
source "$HOME/.profile"
go get -d github.com/eris-ltd/eris-cli
cd $GOPATH/src/github.com/eris-ltd/eris-cli
git checkout release_0.12
go install ./cmd/eris
export ERIS_PULL_APPROVE=true
eris init
docker pull tutum/logrotate

