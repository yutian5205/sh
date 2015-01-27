#!/bin/bash
#这个脚本是用来清空日志的。

#判断是否为root，只有root能执行

if [ "$UID" != "0" ];then
	echo "只有root用户才能执行！"
	exit 0
fi

log_dir=/var/log
lines=100

#判断用户是否输入行数，如果没有使用系统默认。

if [ -n "$1" ];then
	Lines="$1"
else
	Lines=$lines
fi

cd $log_dir
if [ $(pwd) != "$log_dir" ];then
	echo "can't  change to $log_dir"
	exit 1
fi

echo "$Lines"
tail -n $Lines messages > temp.mess
cat /dev/null > messages
mv temp.mess messages
echo "日志清空完成！"
