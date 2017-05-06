if [ $# != 1 ]
then
	echo -a --add hosts and remove advertisement.
	echo -b --add hosts only.
	echo -c --force backuping hosts only. It may write hosts in the backup file.
	echo -r --restore hosts.
	echo Please run it by root.
	echo DO NOT RUN IT IN /etc!
	exit 0
fi

case "$1" in
	-a)
	if [ -f /etc/hosts.bak ]
	then
		cat /etc/hosts.bak > /etc/hosts
		rm hosts*
		curl -O https://raw.githubusercontent.com/Lerist/Go-Hosts/master/hosts -k
		cat hosts >> /etc/hosts
		curl -O https://raw.githubusercontent.com/Lerist/Go-Hosts/master/hosts-ad -k
		cat hosts-ad >> /etc/hosts
		echo Successful
		exit 0
	else
		cp /etc/hosts /etc/hosts.bak
		rm hosts*
		curl -O https://raw.githubusercontent.com/Lerist/Go-Hosts/master/hosts -k
		cat hosts >> /etc/hosts
		curl -O https://raw.githubusercontent.com/Lerist/Go-Hosts/master/hosts-ad -k
		cat hosts-ad >> /etc/hosts
		echo Successful
		exit 0
	fi
	;;
	-b)
	if [ -f /etc/hosts.bak ]
	then
		cat /etc/hosts.bak > /etc/hosts
		rm hosts*
		curl -O https://raw.githubusercontent.com/Lerist/Go-Hosts/master/hosts -k
		cat hosts >> /etc/hosts
		echo Successful
		exit 0
	else
		cp /etc/hosts /etc/hosts.bak
		rm hosts*
		curl -O https://raw.githubusercontent.com/Lerist/Go-Hosts/master/hosts -k
		cat hosts >> /etc/hosts
		echo Successful
		exit 0
	fi
	;;
	-c)
	cat /etc/hosts > /etc/hosts.bak
	exit 0
	;;
	-r)
	if [ -f /etc/hosts.bak ]
	then
		cat /etc/hosts.bak > /etc/hosts
		exit 0
	else
		echo "Can't find the backup file."
		exit 0
	fi
	;;
esac
echo -a --add hosts and remove advertisement.
echo -b --add hosts only.
echo -c --force backuping hosts only. It may write hosts in the backup file.
echo -r --restore hosts.
echo Please run it by root.
echo DO NOT RUN IT IN /etc!
exit 0
