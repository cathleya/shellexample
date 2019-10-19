#!/bin/bash

httpRequest()
{
    #curl 请求
    #info=`curl -s -m 30 --connect-timeout 30 -I $1`
    info=`curl -I $1`
 
    #获取返回码
    code=`echo $info|grep "HTTP"|awk '{print $2}'`
    #对响应码进行判断
    if [ "$code" == "200" ];then
        echo "请求成功，响应码是$code"
    elif [ "$code" == "404" ];then
        echo "请求失败，响应码是$code"
        exit
    else
        echo "请求失败，响应码是$code"
    fi
}
 
while [[ true ]]; do
	httpRequest 'http://180.215.238.4/e.php'
    #httpRequest "172.22.147.68/b.php"
done