#!/usr/bin/env bash

target=$1
lines=$2

for line in $(seq 1 $lines) ; do 
	echo "$line" >> "$target"
	git add "$target"
	GIT_CONFIG_GLOBAL= \
	GIT_CONFIG_SYSTEM= \
	GIT_AUTHOR_NAME="$(base64 < /dev/urandom | head -c10)" \
	GIT_AUTHOR_EMAIL="$(base64 < /dev/urandom | head -c10)@hotmail.com" \
	GIT_COMMITTER_NAME="$(base64 < /dev/urandom | head -c10)" \
	GIT_COMMITTER_EMAIL="$(base64 < /dev/urandom | head -c10)@hotmail.com" \
	git commit --allow-empty -m "added line $line"
done
