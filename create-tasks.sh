#!/bin/bash

echo "77777777">&1
# "77777777">stdout
# echo "[$(date)] Docker GC has completed." >> /var/log/cron.log
task='* * * * * echo "$redПривет из крона !!! $nc" >/proc/1/fd/1 2>/proc/1/fd/2'
#crontab crontab
#echo -e $task > crontab.tmp
# mkdir /etc/cron.d
# echo '* * * * * echo "$redПривет из крона !!! $nc" >/proc/1/fd/1 2>/proc/1/fd/2' >> /etc/cron.d/root

# min	hour	day	month	weekday	command
# */15	*	*	*	*	run-parts /etc/periodic/15min
# 0	*	*	*	*	run-parts /etc/periodic/hourly
# 0	2	*	*	*	run-parts /etc/periodic/daily
# 0	3	*	*	6	run-parts /etc/periodic/weekly
# 0	5	1	*	*	run-parts /etc/periodic/monthly

# echo '* * * * * echo "$redПривет из крона !!! $nc" >/proc/1/fd/1 2>/proc/1/fd/2' >> /etc/crontab
echo '* * * * * echo "$redПривет из крона !!! $nc" >/proc/1/fd/1 2>/proc/1/fd/2' >> /var/spool/cron/crontabs/root
echo '' >> /var/spool/cron/crontabs/root
# echo '* * * * * echo "$redПривет из крона !!! $nc" >/proc/1/fd/1 2>/proc/1/fd/2' >> crontab.tmp
# var/spool/cron/crontabs/root

# echo -e "$CRON" "$GC_ARGS echo $redПривет из крона !!! $nc" '>> /var/log/cron.log 2>&1'"\n" >> crontab.tmp

# /usr/sbin/crond
# tail -f /var/log/cron.log
# /sbin/docker-init -- /bin/sh -c /generate-crontab.sh > /var/log/cron.log 2>&1   && crontab crontab.tmp   && /usr/sbin/crond   && tail -f /var/log/cron.log

# echo -e "$CRON" "$GC_ARGS sh /executed-by-cron.sh" '>> /var/log/cron.log 2>&1'"\n" > crontab.tmp

# echo '* * * * * echo "$redПривет из крона !!! $nc" >/proc/1/fd/1 2>/proc/1/fd/2' >> /var/spool/cron/root
# /bin/bash generate-crontab.sh
