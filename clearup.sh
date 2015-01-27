#!/bin/bash
#这个脚本是用来清空日志的。

#判断是否为root，只有root能执行

if [ "$UID" != "0" ];then
	echo "只有root用户才能执行！"
	exit 0
fi

echo "我是root"
