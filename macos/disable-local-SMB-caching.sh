# corrects an issue with mapped drives where only partial content is displayed
# https://support.apple.com/en-us/HT207520
[[ ! -f /etc/nsmb.conf ]]; then
	sudo -s
	echo "[default]" >> /etc/nsmb.conf
	echo "dir_cache_max_cnt=0" >> /etc/nsmb.conf
	exit
fi