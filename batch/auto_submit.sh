#!/bin/bash

# //20190505/1-8随机数字/   内容页
# ///1-8随机数字/           栏目页


rand1(){
	case $1 in
		0) date +%s%N|cut -c 13-13;;
		1) date +%s%N|cut -c 12-13;;
		2) date +%s%N|cut -c 11-13;;
		3) date +%s%N|cut -c 10-13;;
		4) date +%s%N|cut -c 9-13;;
		5) date +%s%N|cut -c 8-13;;
		6) date +%s%N|cut -c 7-13;;
		7) date +%s%N|cut -c 6-13;;
	esac
}

justx(){
	if [[ $1 > 7 ]]; then
		num0=$(rand1 0)
		justx $num0
	else
		 echo $1
	fi
}

#8伪随机数
random(){
	num0=$(rand1 0)
	num1=$(justx $num0)
	number=$(rand1 $num1)
	echo $number
}



echo "<=======start=======>"

for (( i = 0; i < 100; i++ )); do
	echo $(random)
	date +%Y%m%d
	
done

echo "<=======complete=======>"


sleep 20