#!/usr/bin/env bash
exec setuser $GERRIT_USER java -jar $GERRIT_HOME/gerrit.war daemon -d $GERRIT_HOME/gerrit --run-id=100
