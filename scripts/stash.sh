# Created from RS-52 requirements
#!/bin/bash

LOG=/home/$USER/scripts/backup.txt
APP="stash"

echo $(date "+%Y-%m-%d %H-%M-%S") "Process started for" $APP >> $LOG
cp -r /home/arruser/$APP/config.yml /home/$USER/backup/$HOSTNAME/$APP &>> $LOG
cp -r /home/$USER/$APP/stash-go.sqlite /home/$USER/backup/$HOSTNAME/$APP &>> $LOG
cp -r /home/$USER/$APP/stash-go.sqlite-shm /home/$USER/backup/$HOSTNAME/$APP &>> $LOG
cp -r /home/$USER/$APP/stash-go.sqlite-wal /home/$USER/backup/$HOSTNAME/$APP &>> $LOG
cp -r /home/arruser/whisparr/private/blobs /home/$USER/backup/$HOSTNAME/$APP &>> $LOG
cp -r /home/arruser/whisparr/private/generated /home/$USER/backup/$HOSTNAME/$APP &>> $LOG
echo $(date "+%Y-%m-%d %H-%M-%S") "Process ended for" $APP >> $LOG