#!/bin/sh
. ~/.dotfiles/helpers/colors.sh

clear
echo ${GREEN} "\n Initializing backup from S3 to Lacie Rugged \n\n" ${NC}

while true
do
    rclone sync \
        myflows3:myflow \
        /Volumes/LaCie\ Rugged/MyFlow\ S3 \
        --backup-dir=/Volumes/LaCie\ Rugged/MyFlow\ S3\ Incrementals/`date +%Y%m%d.%I%M%S` \
        --quiet \
        --progress \
        --fast-list \
        --max-backlog=-1 \
        --exclude '.*', \
        --log-file=logs/transfer.log \


    secs=$((60 * 60 * 2))
    while [ $secs -gt 0 ]; do
        clear
        echo "\n"
        echo "\n"
        echo ${RED} $((secs/3600))'h' $((secs%3600/60))'m' $((secs%60))'s until next run for:'
        echo ${GREEN}  'Backup from S3 to Lacie Rugged'
        echo "\n"
        sleep 1
        : $((secs--))
    done
done