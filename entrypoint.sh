for file in `ls /etc/init.d`
do if [ -x /etc/init.d/${file} ];  then
    /etc/init.d/$file restart
fi done
crond
bt default
/usr/sbin/init
tail -f /dev/null