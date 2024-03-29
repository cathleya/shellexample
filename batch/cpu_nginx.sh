#!/bin/sh
# toontong @ 2010-09-20
# @kingsoft.com
nginx_bin=/www/server/nginx/sbin/nginx
isExitsNginx()
{
    ps aux | grep nginx | grep -vc "grep"
}
function_kill_nginx()
{
    while [ `isExitsNginx` /> 0 ]
    do
        kill -QUIT $(ps -ef |grep nginx | grep -v "grep" | awk -F ' ' '{print $2}')
        sleep 0.1
    done
    printf '/n'
    date
    printf "kill nginx done./n"
}
function_start_nginx()
{
    if [ `isExitsNginx` /> 0 ]; then
        printf "Nginx is running..../n"
        exit -1
    fi
    ${nginx_bin} -v -t
    ${nginx_bin}
    sleep 0.2
    if [ `isExitsNginx` /> 0 ]; then
        printf "Nginx start..../n"
    else
        printf "error...Nginx not run./n"
        exit -2
    fi
}
function_cpu_used_rate()
{
    ##echo user nice system idle iowait irq softirq
    CPULOG_1=$(cat /proc/stat | grep 'cpu ' | awk '{print $2" "$3" "$4" "$5" "$6" "$7" "$8}')
    SYS_IDLE_1=$(echo $CPULOG_1 | awk '{print $4}')
    Total_1=$(echo $CPULOG_1 | awk '{print $1+$2+$3+$4+$5+$6+$7}')
    
    sleep 2
    
    CPULOG_2=$(cat /proc/stat | grep 'cpu ' | awk '{print $2" "$3" "$4" "$5" "$6" "$7" "$8}')
    SYS_IDLE_2=$(echo $CPULOG_2 | awk '{print $4}')
    Total_2=$(echo $CPULOG_2 | awk '{print $1+$2+$3+$4+$5+$6+$7}')
    
    SYS_IDLE=`expr $SYS_IDLE_2 - $SYS_IDLE_1`
    
    Total=`expr $Total_2 - $Total_1`
    SYS_USAGE=`expr $SYS_IDLE/$Total*100 |bc -l`
    #echo $SYS_USAGE    
    SYS_Rate=`expr 100-$SYS_USAGE |bc -l`
    Disp_SYS_Rate=`expr "scale=3; $SYS_Rate/1" |bc`
    echo $Disp_SYS_Rate
}

CPU_STATUS=-1
cnt=0
while true ; do
  CPU_STATUS=`function_cpu_used_rate`
#  echo $CPU_STATUS
  if [ $(echo "$CPU_STATUS > 98"|bc) = 1 ];then
    cnt=`expr $cnt + 1`
  else
    cnt=0
  fi
  if [ $cnt /> 2 ]; then
    function_kill_nginx
    function_start_nginx
  fi
  sleep 1
done

# 后台飞起
# nohup sh ./checkCpu.sh &
# kill -9 pid