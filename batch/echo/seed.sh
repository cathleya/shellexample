#!/bin/bash

function random_str(){
	MATRIX="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz~!@#$%^&*()_+="
	while [ "${n:=1}" -le "$1" ]
	do
        PASS="$PASS${MATRIX:$(($RANDOM%${#MATRIX})):1}"
        let n+=1
	done
        echo "$PASS"
}

function random_number(){
	min=$1
    max=$(($2-$min+1))
    num=$(($RANDOM+10000000)) 
    echo $(($num%$max+$min))
}

#function insert(){
#	case $1 in
#		0);;
#		1);;
#		2);;
#	esac
#}

function seed(){
	cat $1 | while read line
	do
		echo $1
		echo $line
		number=$(random_number 1 100)
		echo $number
		sleep 1
		#echo $line | sed -i "3i\\$line" $1
	done
}


echo "<=======start=======>"
for dir in $(ls ./)
do
	if [ "$dir" != "seed.sh" ]; then
		 [ -w $dir ] && seed $dir
	fi
done

echo "<=======complete=======>"

sleep 5