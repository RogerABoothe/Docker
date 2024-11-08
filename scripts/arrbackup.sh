# Created from RS-44 requirements
#!/bin/bash

. /home/arruser/scripts/arrbackup.config

LOG=/home/$USER/scripts/arrbackup.txt

X=1
while [ $X -le 5 ]
do

    case $X in

        1)
            APP="whisparr"
            ;;

        2)
            APP="sonarr"
            ;;

        3)
            APP="radarr"
            ;;

        4)
            APP="lidarr"
            ;;

        5)
            APP="prowlarr"
            ;;
    esac

    echo $(date "+%Y-%m-%d %H-%M-%S") "Process started for" $APP >> $LOG
    cp -r /home/arruser/$APP/Backups /home/arruser/backup/$HOSTNAME/$APP &>> $LOG
    echo $(date "+%Y-%m-%d %H-%M-%S") "Process ended for" $APP >> $LOG

    X=$(( $X + 1 ))

done