#!/bin/sh

echo "<=======copy index =======>"

function action1(){
	cp ./index.php ./$1
	echo "success $1 !"
} 

for dir in $(ls ./)
do
 [ -d $dir ] && action1 $dir
done

echo "<=======complete=======>"

sleep 20      