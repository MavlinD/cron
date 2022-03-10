#!/bin/bash

echo -e $blue"[$(date)] Docker GC starting."$nc
# echo $PWD
source ./scripts/protected_volumes.sh
# source /scripts/protected_volumes.sh
# docker volume ls -q | grep -v -e 'rpt_*' -e 'mb_*'
# docker volume ls -q | grep -vE 'rpt_*|mb_*'
# cat var/spool/cron/crontabs/root
volume_args=""
for volume in ${protected_volumes[@]}; do
      volume_args="$volume_args|$volume"
done
volume_args="${volume_args:1}"
# echo $volume_args
volumes=$(docker volume ls -q)
# echo $volumes

for item1 in $volumes; do
#         if [[ ! $item1 =~ (rpt_*|mb_*) ]]; then !!!
        if [[ ! $item1 =~ $volume_args ]]; then
            echo $item1
        fi
#     printf '%s\n' $item1 | grep -Ev 'rpt_*' !!!
done

# echo -e $yellow"$volume_args"$nc
# docker volume rm -f $(docker volume ls -q | grep -vE $volume_args)
# if [ "$CLEAN_UP_VOLUMES" -eq "1" ]
# then
#    if [ $(docker volume ls -qf dangling=true | wc -l) -gt 0 ]
#    then
#       echo "Cleaning up dangling volumes."
#       docker volume rm $(docker volume ls -qf dangling=true)
#    else
#       echo "No dangling volumes found."
#    fi
# fi
#
echo -e $green"[$(date)] Docker GC has completed."$nc
# echo "[$(date)] Docker GC has completed." >> /var/log/cron.log 2>&1
