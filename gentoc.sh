#!/usr/local/bin/bash
# generate table of contents for blog posts
# parameter is directory to read posts from

posts=$1

echo "<table>"
echo "<tr>"
echo "<th>Title</th>"
echo "<th>Date</th>"
echo "</tr>"

for f in $(ls -r1 $posts)
do
   title=$(grep "<h2>" $posts/$f | head -1 | sed -e 's/<h2>//' -e 's/<\/h2>//')
   txtanchor=${f%%.m4}
   set -- $(ls -lD "%Y-%m-%d %H:%M" $posts/$f)
   dt="$6 $7"


   echo "<tr>"
   echo "<td><a href=\"#$txtanchor\">" $title "</a></td>"
   echo "<td>$dt</td>"
   echo "</tr>"
done

echo "</table>"
