#!/bin/bash

#### echo akaxin logo and desc
echo "
    _      _  __     _     __  __  ___   _   _ 
   / \    | |/ /    / \    \ \/ / |_ _| | \ | |
  / _ \   | ' /    / _ \    \  /   | |  |  \| |
 / ___ \  | . \   / ___ \   /  \   | |  | |\  |
/_/   \_\ |_|\_\ /_/   \_\ /_/\_\ |___| |_| \_|
     
Akaxin is an open source and free proprietary IM software，you can build private openzaly-server for everyone in any server.
openzaly-version : 0.5.4

"

PORT=$1
JAVA_JAR="openzaly-server"

##set tcp port
if [ -n $PORT ]; then
	PORT=2021
fi
	
echo "【OK】openzaly-server is closing 【PORT="$PORT"】"

PID=$(ps -ef|grep $JAVA_JAR|grep $PORT |head -1| awk '{printf $2}')

if [ $? -eq 0 ]; then
    echo "【OK】openzaly-server is running on PID="$PID
else
    echo "【ERROR】openzaly-server stop failure, as it's not existed."
    exit
fi


kill -9 ${PID}

if [ $? -eq 0 ];then
    echo "【OK】openzaly-server is stoped【PORT:"$PORT" PID:"$PID"】"
else
    echo "【ERROR】openzaly-server stop failure."
fi

echo ""