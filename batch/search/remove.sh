#!/bin/bash

seed(){
	sed -i '1d' ./$1/index.html
	echo "success $1 !"
}


echo "<=======copy starting =======>"

for dir in $(ls ./)
do
 [ -d $dir ] && seed $dir
done

echo "<=======complete=======>"

sleep 10    
