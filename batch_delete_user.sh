#!/bin/bash



dir=`dirname $0`
source_file="$dir/users_list.txt"

iter_num=1

for user_data in $(cat "$source_file"); do

login=$(echo "$user_data" | awk -F ',' {'print $1'})



echo "Delete user with login: $login..."
cd /home/
if [ "$1" == "backup" ];then
echo ">Backup..."
if [ $iter_naum -eq 1 ];then
tar -cf /opt/backup.tar "$login" &>> /dev/null
else
tar -rf /opt/backup.tar "$login"
fi
if [ $? -ne 0 ];then 
echo "Error: user home directory doesn't exist"
else
echo ">Backup done"
fi
fi




deluser --remove-home  "$login" &>>/dev/null



if [ $? -ne 0 ];then
echo "error: User does not exist"
els
echo "done"
fi


# command...



 
#[ $iter_num -eq 3 ] && exit 8 #FIXME !!!

#iter_num=$(($iter_num+1))

done
