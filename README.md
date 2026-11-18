# QubesOS lockdown script to launch when the desktop (xfce) is locked for a certain period of time

This script allows you to run specific commands when the QubesOS desktop remains locked for a period of time. This must be run in dom0 and you need to change the .service file to the location of the lockdown.sh script. The lockdown.sh can be placed anywhere and the lockdown.service is to be placed in /etc/systemd/system/multi-user.target.wants/ The script can be edited for the amount of time until the commands are ran and what commands are ran.

(I am aware its not very well programmed and if I were to redo it I would have ran a trigger that once the desktop is locked, it would have a time function, check again and then run a function but there's nothing more permanent than a temporary solution that works and this has been working without a bug for years at this point)
