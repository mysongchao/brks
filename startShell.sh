#! /bin/bash

server_name="hello"
server_path=/home/songchao/dnschool/05shell/hello


start(){
	echo "--start-"
    ($server_path) &
    pid=$(ps -ef|grep $server_name |grep -v grep |awk '{print $2}')
    if [ ! $pid ]; then
		echo "service is not exit ..."
    else
		echo "pid=$pid"
    fi
}

stop(){
	pid=$(ps -ef|grep $server_name |grep -v grep |awk '{print $2}')
	if [ ! $pid ]; then
		echo "service is not exit ..."
	else
		kill -9 $pid
	fi
}

checkrun(){	
	while true
	do
		pid=$(ps -ef|grep $server_name |grep -v grep |awk '{print $2}')
		if [[ $pid -eq 0 ]]; then
			echo "--restart-"
			start 
		fi

		sleep 30s
	done
}

case $1 in
start):
	start
	;;
stop):
	echo "--stop"
	echo $pid
	stop
	;;
checkrun):
	echo "--restart"
	checkrun
	;;
*):
	echo "error ..."
	;;
esac

exit 0
