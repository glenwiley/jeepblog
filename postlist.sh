#!/usr/local/bin/bash
for f in $(ls -r1 blogposts/)
do
	nm=${f%%.m4}
	incl=$(echo $f | sed 's/^/include\(`/' | sed "s/\$/\'\)/")
	echo "<a name=\"$nm\">"
	# the closing </a> for the name tag is in the article text
	echo "$incl"
	echo "<hr>"
done

