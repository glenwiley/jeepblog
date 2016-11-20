#!/usr/local/bin/bash

tot=0
for a in $(grep -E '(<td>\$.*<\/td>)' spending.html.m4 | sed -e 's/<\/*td>//g' -e 's/\$//')
do
	tot=$((tot + a))
done

echo "$tot"
