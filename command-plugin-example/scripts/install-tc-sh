#!/bin/sh
set -e
if [ -e "/apache-tomcat-7.0.94" ]
then
    echo "/apache-tomcat-7.0.94 already exists. Remove to continue."
    exit 1
fi
unzip $1 -d /
chmod +x /apache-tomcat-7.0.94/bin/*.sh
