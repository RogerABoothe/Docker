# Created from RS-44 requirements
#!/bin/bash

LOG=/home/$USER/scripts/backup.txt

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
    pg_dump -U $USER -d $APP-main -f /home/$USER/backups/$HOSTNAME/$(date "+%Y-%m-%d")$APP-log.sql &>> $LOG
    pg_dump -U $USER -d $APP-main -f /home/$USER/backups/$HOSTNAME/$(date "+%Y-%m-%d")$APP-main.sql &>> $LOG
    echo $(date "+%Y-%m-%d %H-%M-%S") "Process ended for" $APP >> $LOG

    X=$(( $X + 1 ))

done