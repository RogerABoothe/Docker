# Created from RS-44 requirements
#!/bin/bash

. /home/arrdbuser/scripts/arrdbbackup.config

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
    pg_dump -U arrdbuser -d $APP-main -f /home/arrdbuser/backups/$HOSTNAME/$(date "+%Y-%m-%d")$APP-log.sql &>> $LOG
    pg_dump -U arrdbuser -d $APP-main -f /home/arrdbuser/backups/$HOSTNAME/$(date "+%Y-%m-%d")$APP-main.sql &>> $LOG
    echo $(date "+%Y-%m-%d %H-%M-%S") "Process ended for" $APP >> $LOG

    X=$(( $X + 1 ))

done