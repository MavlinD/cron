#!/bin/bash -eux

echo -e $blue"[$(date)] Docker clean starting."$nc
# echo $PWD
# source ./scripts/protected_containers.sh
source /scripts/protected_containers.sh
# docker container ls -q | grep -v -e 'rpt_*' -e 'mb_*'
# docker container ls -q | grep -vE 'rpt_*|mb_*'
# cat var/spool/cron/crontabs/root
container_args=""
for container in ${protected_containers[@]}; do
      container_args="$container_args|$container"
done
container_args="${container_args:1}"
echo $container_args
# yesterday=$(date -d yesterday +%s)
# yesterday=$(date -d 100 +%s)
# date=$(date -d "$(echo ${@:2:3})" +%s)
# echo $yesterday
# echo $date
# containers=$(docker ps --filter since="$date")
# str=$(echo docker ps -a)
# yesterday=$(date -d yesterday +%s)
# dnsdock should not be stopped : we limit to the containers created after it

# str=$(echo docker ps -a --filter since=$yesterday --format "'{{.ID}} {{.Names}}'")
# echo $str
# eval $str
# containers=$(docker ps --filter since="$yesterday" -a --format "{{.Names}}")
containers=$(docker ps -a --format "{{.Names}}")
# echo $containers
for container in $containers; do
#         if [[ ! $container =~ (rpt_*|mb_*) ]]; then !!!
#     printf '%s\n' $container
        if [[ ! $container =~ $container_args ]]; then
            echo $container
            docker container rm $container
        fi
#     printf '%s\n' $container | grep -Ev 'rpt_*' !!!
done

# echo -e $yellow"$container_args"$nc
# docker container rm -f $(docker container ls -q | grep -vE $container_args)
# if [ "$CLEAN_UP_containers" -eq "1" ]
# then
#    if [ $(docker container ls -qf dangling=true | wc -l) -gt 0 ]
#    then
#       echo "Cleaning up dangling containers."
#       docker container rm $(docker container ls -qf dangling=true)
#    else
#       echo "No dangling containers found."
#    fi
# fi
#
echo -e $green"[$(date)] Docker clean has completed."$nc
# echo "[$(date)] Docker GC has completed." >> /var/log/cron.log 2>&1
