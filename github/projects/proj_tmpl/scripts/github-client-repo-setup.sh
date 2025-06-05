#!/bin/bash

WORKDIR="/home/dojo"

REPO="$WORKDIR/repo"

downstream_repo="$REPO/downstream"
upstream_repo="$REPO/upstreamstream"


mkdir $REPO
mkdir $downstream_repo
mkdir $upstream_repo



git clone git@github.com:EOEX/eoex-client.git $downstream_repo
git clone git@github.com:EOEX/eoex-base-dev.git $upstream_repo