#!/usr/bin/env bash

REPOSDIR=../perl6-contributors/repos
METADIR=t/meta

mkdir -p $METADIR
find $REPOSDIR -regex '.*/META6?\..*' -a -type f \
   | xargs -IFILE echo 'F=$(basename FILE); D=$(basename $(dirname FILE)); cp -v FILE '$METADIR'/$D-$F;' \
   | sh

