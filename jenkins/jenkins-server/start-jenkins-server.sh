#!/bin/sh
# author: Laurent Malvert <laurent.malvert@gmail.com>
#
# A simple script to bootstrap the Jenkins server with the appropriate setup,
# meaning it will point to the correct JENKINS_HOME folder and use the appropriate
# environment and JVM properties.
#
# This is only useful when bootstrapping a server outside of a dockerized
# jenkins server setup. We don't want to use this in the long-run,
# or at least not directly, and instead integrate our jenkins server setup
# as part of our docker-compose software-factory setup.

export JENKINS_HOME=/opt/jenkins
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export DOMAINS="*.software-factory.lan"


java				\
    -DLC_ALL=en_US.UTF-8	\
    -DLANG=en_US.UTF-8		\
    -Dfile.encoding=UTF-8	\
    -Dsun.jnu.encoding=UTF-8	\
    -Dhudson.model.DirectoryBrowserSupport.CSP="default-src 'self' ${domains};script-src 'self' 'unsafe-inline' ${domains};style-src 'self' 'unsafe-inline' ${domains};" \
    -jar jenkins.war
