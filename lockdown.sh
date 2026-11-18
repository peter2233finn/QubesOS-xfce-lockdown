sleep 15;
while true; do
	export DISPLAY=':0.0'
	export XAUTHORITY=/run/lightdm/sirk/xauthority
	 sleep 10
	 tltime=$(xscreensaver-command -time|grep 'locked since' | awk '{print $9}' | tr -d ':')
	 ltime=${tltime#0}

	 tcurt=$(date | awk '{print $4}'|tr -d ':')
	 curt=${tcurt#0}

	if [ ! -z "$ltime" ]; then

    # this is the time at which to lock the system
    # It is derived from the xscreensaver-command. This tirns the current time, eg 23:43:01 (HH:MM:SS) to 234301
    # the lockdown is set to a sum of this. To set this, add the amount of time until you want the lockdown to start to the varible timeWait.
    # eg timeWait=1000 for 10 minuits, timeWait=2000 for 20 mins, timeWait=20 for 20 seconds or timeWait=10000 for 1 hour.

    timeWait=1000 # 10 minuits
    
		sdtime=$(($ltime+timeWait)) # 10 minuits
		if [ $curt -gt $sdtime ]; then
      echo 'STARTING LOCKDOWN'
      # This part is executed when QubesOS UI has been locked for x amount of time
      # The following are examples.
      
			# qvm-shutdown XXX &
			# qvm-shutdown XXX --force &

			echo "SHUTTING DOWN"
			# sudo systemctl poweroff -i
			# systemctl poweroff -i

		fi
 	fi
 done
