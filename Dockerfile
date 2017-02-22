# gerrit
#
FROM java:alpine
MAINTAINER lifei

ENV GERRIT_USER gerrit2
ENV GERRIT_HOME /home/${GERRIT_USER}
ENV GERRIT_ROOT ${GERRIT_HOME}/gerrit
ENV GERRIT_WAR /usr/local/bin/gerrit.war
ENV GERRIT_VERSION 2.13.5

COPY init.sh /tmp/init.sh
RUN sh /tmp/init.sh


USER ${GERRIT_USER}

CMD java -jar ${GERRIT_WAR} daemon -d ${GERRIT_ROOT} --run-id=100

EXPOSE 8080 29418
