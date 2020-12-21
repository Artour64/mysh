#!/bin/dash
urlsFile=~/3080gpu.txt

printStock(){
	local url=$(echo "$1"|cut -d " " -f1);
	#local name=$(echo "$1"|cut -d " " -f1 --complement);
	local data=$(curl -s "$url" | grep -i -o -e "out of stock" -e "in stock" | sort -f -u)

	#echo "$name\n$data\n$url\n"
	if [ -n "$(echo $data | grep -i -o "in stock")" ];then
		if [ -z "$(echo $data | grep -i -o "out of stock")" ];then
			echo "$url"
		fi
	fi
}

printStocks(){
	if [ "$#" = 0 ] ; then
        while read -r line ; do
        	if [ -n "$line" ]; then
				printStock "$line" &
				sleep 0.2
			fi
		done
    fi
}
#echo "$urls" | printStocks | less
out=$(cat $urlsFile | printStocks)
if [ -n "$out" ];then
	echo "$out" | less
else
	echo "Nothing in stock"
fi

