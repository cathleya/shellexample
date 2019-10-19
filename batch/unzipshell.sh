#!/bin/sh

echo "<=======copy index =======>"

function action1(){
	cp ./1.zip ./$1
	cd ./$1
	unzip -o 1.zip
	rm ./1.zip
	cd ../
	echo "success $1 !"
} 

for dir in $(ls ./)
do
 [ -d $dir ] && action1 $dir
done

echo "<=======complete=======>"

sleep 20      