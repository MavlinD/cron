#!/bin/bash

echo -e $blue"[$(date)] Docker clean starting."$nc
# echo $PWD
# source ./scripts/protected_volumes.sh
source /scripts/protected_volumes.sh
volume_args=""

for volume in ${protected_volumes[@]}; do
      volume_args="$volume_args|$volume"
done

volume_args="${volume_args:1}"
echo $volume_args

volumes=$(docker volume ls -q)

for volume in $volumes; do
        if [[ ! $volume =~ $volume_args ]]; then
#             echo $volume
            docker volume rm $volume
        fi
done

echo -e $green"[$(date)] Docker clean has completed."$nc
