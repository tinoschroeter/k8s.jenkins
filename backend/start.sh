#/bin/bash
sleep 100

/usr/bin/java -Djava.awt.headless=true -jar /usr/share/jenkins/jenkins.war \
  --webroot=/var/cache/jenkins/war --httpPort=8080
