#!/bin/sh
#chkconfig:2345 80 90
#description:auto_clearlog

while :
do
	sleep 20
	rm -rf /home/www/wwwroot/*
	sleep 259200
done


#放到/etc/init.d/auto_clearlog.sh
#然后chmod +x /etc/init.d/auto_clearlog.sh
 
#然后加到开机启动中：
#chkconfig --add auto_clearlog.sh

#chkconfig有几个等级：
#0：表示关机
#1：表示单用户模式
#2：表示无网络链接多用户命令行模式
#3：表示有网络链接多用户命令行模式
#4：表示不可用情况
#5：表示带图形界面的多用户模式
#6：表示重新启动


# 后台飞起
# nohup sh ./checkCpu.sh &
# kill -9 pid


