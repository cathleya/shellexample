#!/bin/bash

seed(){

	#sed "s/http:\/\/zybjs.oss-cn-beijing.aliyuncs.com\/xm.js/https:\/\/zybjs.oss-cn-beijing.aliyuncs.com\/xm.js/g" $1
	sed -i 's#http://zybjs.oss-cn-beijing.aliyuncs.com/xm.js#https://zybjs.oss-cn-beijing.aliyuncs.com/xm.js#g' ./$1/index.html
	echo "success $1 !"
}


echo "<=======copy starting =======>"

for dir in $(ls ./)
do
 [ -d $dir ] && seed $dir
done

echo "<=======complete=======>"

sleep 25    
