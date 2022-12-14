#!/usr/bin/env bash
set -e

if [ $# == 1 ]
then 
    echo "Download plugins."
    java -jar /app/bin/jenkins-plugin-manager.jar --war /app/jenkins/jenkins.war --plugin-file "$1" --plugin-download-directory=/jenkins_new_plugins
    ls -al /jenkins_new_plugins
    cp -r /jenkins_new_plugins/* /usr/share/jenkins/ref/plugins
else
    echo "No plugins downloaded."
fi
