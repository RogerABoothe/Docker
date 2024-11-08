# Created from RS-51 requirements
#!/bin/bash

LOG=/home/$USER/scripts/backup.txt
APP="qBittorent"

echo $(date "+%Y-%m-%d %H-%M-%S") "Process started for" $APP >> $LOG
cp -r /home/arruser/$APP/$APP/qBittorrent.conf /home/$USER/backup/$HOSTNAME/$APP &>> $LOG
echo $(date "+%Y-%m-%d %H-%M-%S") "Process ended for" $APP >> $LOG