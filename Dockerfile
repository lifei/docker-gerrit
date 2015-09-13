# gerrit
#
FROM lifei/java

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git-core

ENV GERRIT_USER gerrit2
ENV GERRIT_HOME /home/${GERRIT_USER}
ENV GERRIT_WAR ${GERRIT_HOME}/gerrit.war
ENV GERRIT_VERSION 2.11.2
RUN useradd -m ${GERRIT_USER}

RUN curl -fSL -o $GERRIT_WAR https://gerrit-releases.storage.googleapis.com/gerrit-${GERRIT_VERSION}.war
RUN chown -R ${GERRIT_USER}:${GERRIT_USER} $GERRIT_HOME
RUN setuser ${GERRIT_USER} java -jar $GERRIT_WAR init --batch -d ${GERRIT_HOME}/gerrit

RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh
COPY service_gerrit_run.sh /etc/service/gerrit/run
RUN chmod a+x /etc/service/gerrit/run

EXPOSE 8080 29418
