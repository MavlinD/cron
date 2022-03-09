FROM clockworksoul/docker-gc-cron:latest

COPY create-tasks.sh .
COPY .bashrc /root
COPY crontab .
#RUN bash create-tasks.sh

#RUN #/bin/bash ls
#RUN echo 'we are running some # of cool things'
#RUN ["/bin/bash", "/create-tasks.sh"]
#RUN ["/bin/bash", "-c", "echo hello>test.txt"]
#RUN ["/bin/bash", "-c", "/generate-crontab.sh"]

#ENTRYPOINT ["/bin/sh", "-c" ]
#ENTRYPOINT ["/bin/sh", "-c", "/executed-by-cron.sh" ]
#CMD ["/bin/sh", "-c", "/executed-by-cron.sh" ]
#ENTRYPOINT ["/bin/sh", "/executed-by-cron.sh" ]
#ENTRYPOINT ["/bin/sh", "-c", "/executed-by-cron.sh" ]
#ENTRYPOINT ["/bin/sh", "-c", "/generate-crontab.sh" ]
#CMD  cron > log
#CMD  /generate-crontab.sh > log
