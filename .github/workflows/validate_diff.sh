#!/bin/sh
SOURCE=${1:-master}
TARGET=${2:-HEAD}
FILTER=${3:-.*}
exec git diff $SOURCE $TARGET -- $(cat <(git ls-tree --name-only -r $SOURCE) <(git ls-tree --name-only -r $TARGET) | sort | uniq | grep "$FILTER")