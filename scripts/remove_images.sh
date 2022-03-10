#!/bin/bash

echo -e $blue"[$(date)] Docker clean starting."$nc
# echo $PWD

images=$(docker images -q --filter "dangling=true")
for image in $images; do
#             echo $image
            docker image rm $image
done

echo -e $green"[$(date)] Docker clean has completed."$nc

eval "docker system df"
