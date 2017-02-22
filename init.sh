#!/usr/bin/env sh

umask 022
set -e

apk --update upgrade && apk add --update git curl && rm -rf /var/cache/apk/* /tmp/*

adduser -h ${GERRIT_HOME} -S -D ${GERRIT_USER}
curl -fSL -o ${GERRIT_WAR} https://gerrit-releases.storage.googleapis.com/gerrit-${GERRIT_VERSION}.war

cat > /usr/local/bin/init-gerrit.sh <<EOF
#!/usr/bin/env sh
java -jar ${GERRIT_WAR} init --batch -d ${GERRIT_ROOT}
EOF

chmod a+x /usr/local/bin/init-gerrit.sh
