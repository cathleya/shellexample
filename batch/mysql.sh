#!/bin/sh

echo "<=======welcome mysql operation=======>"

sql="sql_625889_com.sql"

path="c:/Users/herry/desktop"

user="root"

pwd="50c1ecd443b332d1"

dbname="sql_625889_com"

host="127.0.0.1"

function exportsql(){
	echo "exportsql..."

	#mysqldump -u用户名 -p密码 -h主机 数据库名 -d > 路径 
	mysqldump -u $user -p $pwd -h $host $dbname -d > $path/$sql  

	echo "<============complete============>"
}

function exportsql_withdata(){
	echo "exportsql with data..."

	mysqldump -u $user -p $pwd -h $host $dbname > $path/$sql 

	echo $path/$sql
	echo "<============complete============>"
}

function exportsql_withcondation(){
	echo "exportsql with condation..."

	# mysqldump -u用户名 -p密码 -h主机  数据库名 表名  --where "sql语句"> 路径
	# mysqldump -u$user -p$passwd -h$host $dbname  $tablename --where "id > 1 and id < 1000"  > 1.sql 
	mysqldump -u$user -p$pwd -h$host $dbname > $path/$sql 

	echo "<============complete============>"
}

function importsql(){
	echo "importsql..."

	mysql -h$host -u$user -p$pwd $dbname < $path/$sql

	echo "<============complete============>"
}


echo '1:exportsql; 2：exportsql with data；3：exportsql with condation; 4：importsql; *:quit ;'
echo 'Your choice:'
read option
case $option in
    1)  exportsql
    ;;
    2)  exportsql_withdata
    ;;
    3)  exportsql_withcondation
    ;;
    4)  importsql
    ;;
    *)  echo 'quit'
    ;;
esac


sleep 10

