user=`whoami`
echo $user
sed -i "s+/USER+/$user+g" wifi_mirror.service
