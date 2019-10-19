#!/bin/bash

function seed(){
	sed -i 's/{dede:global.cfg_powerby\/}/<h3>友情链接：<\/h3>/' ./$1/templets/ziyuanbu/index.htm
	sed -i 's/由资源部研发部提供技术支持/<b><a href= http:\/\/www.057.org>57赚钱网<\/a><\/b>/' ./$1/templets/ziyuanbu/index.htm
	sed -i 's/{dede:global.cfg_powerby\/}/<h3>友情链接：<\/h3>/' ./$1/templets/ziyuanbu/footer.htm
	sed -i 's/由资源部研发部提供技术支持/<b><a href= http:\/\/www.057.org>57赚钱网<\/a><\/b>/' ./$1/templets/ziyuanbu/footer.htm
	echo "success $1 !"
}

echo "<=======start=======>"
for dir in $(ls ./)
do
	if [ "$dir" != "exchange.sh" ]; then
		 [ -d $dir ] && seed $dir
	fi
done

echo "<=======complete=======>"

sleep 30    