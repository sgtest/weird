#!/usr/bin/env bash

count="$1"

for i in $(seq 1 "$count") ; do
	GIT_CONFIG_GLOBAL= \
		GIT_CONFIG_SYSTEM= \
		GIT_AUTHOR_NAME="$(base64 < /dev/urandom | head -c10)" \
		GIT_AUTHOR_EMAIL="$(base64 < /dev/urandom | head -c10)@hotmail.com" \
		GIT_COMMITTER_NAME="$(base64 < /dev/urandom | head -c10)" \
		GIT_COMMITTER_EMAIL="$(base64 < /dev/urandom | head -c10)@hotmail.com" \
		git commit --allow-empty -m "commit #${i}"
done
