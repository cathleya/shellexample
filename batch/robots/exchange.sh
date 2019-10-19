#!/bin/sh

echo "<=======copy index =======>"

function action1(){
	rm ./$1/robots.txt
	cp ./robots.txt ./$1

	sitemap="http://www.$1sitemap.xml"
	sed -i '$a'$sitemap ./$1/robots.txt

	echo "success $1 !"
} 

for dir in $(ls ./)
do
 [ -d $dir ] && action1 $dir
done

echo "<=======complete=======>"

sleep 20      