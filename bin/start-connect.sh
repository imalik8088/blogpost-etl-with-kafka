#!/usr/bin/env bash

: ${SUSPEND:='n'}

set -e

mvn clean package
export KAFKA_JMX_OPTS="-Xdebug -agentlib:jdwp=transport=dt_socket,server=y,suspend=${SUSPEND},address=5005"
export CLASSPATH="$(find target -type f -name '*jar-with-dependencies.jar')"

echo "\n****** Restart connect Container ******\n"
docker restart connect_blogpost
