#!/usr/bin/env bash

# y (year), m (month), d (day)
interval="$1"

START_DATE='1980-01-01'
END_DATE='2024-01-01'
DATE_FORMAT='%Y-%m-%d'
endt=$(date -jf "$DATE_FORMAT" "$END_DATE" '+%s')
i="$START_DATE"

while [[ $(date -jf "$DATE_FORMAT" "$i" '+%s') -le $endt ]]; do
	echo "$i"
	GIT_CONFIG_GLOBAL= \
		GIT_CONFIG_SYSTEM= \
		GIT_AUTHOR_NAME="$(base64 < /dev/urandom | head -c10)" \
		GIT_AUTHOR_EMAIL="$(base64 < /dev/urandom | head -c10)@hotmail.com" \
		GIT_AUTHOR_DATE="$(date -jf "$DATE_FORMAT" "$i" '+%s')" \
		GIT_COMMITTER_NAME="$(base64 < /dev/urandom | head -c10)" \
		GIT_COMMITTER_EMAIL="$(base64 < /dev/urandom | head -c10)@hotmail.com" \
		GIT_COMMITTER_DATE="$(date -jf "$DATE_FORMAT" "$i" '+%s')" \
		git commit --allow-empty -m "commit at $i"

	i=$(date -v+1$interval -jf "$DATE_FORMAT" "$i" "+$DATE_FORMAT")
done
