FROM ubuntu:groovy AS jenkins

RUN apt-get install apt-utils=2.1.10ubuntu0.3 wget=1.20.3-1ubuntu1 apt-transport-https=2.1.10ubuntu0.3 \
ca-certificates=20210119~20.10.1 curl=7.68.0-1ubuntu4.3 gnupg=2.2.20-1ubuntu1.1 -y --no-install-recommends

# Install java11
RUN wget https://github.com/bell-sw/Liberica/releases/download/11.0.11%2B9/bellsoft-jdk11.0.11+9-linux-aarch64.deb
RUN apt-get install ./bellsoft-jdk11.0.11+9-linux-aarch64.deb -y
RUN rm bellsoft-jdk11.0.11+9-linux-aarch64.deb

RUN update-alternatives --config javac
RUN update-alternatives --config java

RUN sh -o pipefail 'wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key |  apt-key add -'

RUN echo "deb https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list

RUN apt-get update && \
rm -rf /var/lib/apt/lists/*

RUN apt-get install jenkins=2.319.1 -y --no-install-recommends

RUN echo "Password"
#RUN cat /var/lib/jenkins/secrets/initialAdminPassword

ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000
ARG http_port=8080
ARG agent_port=50000
ENV JENKINS_HOME=/var/jenkins_home
ENV JENKINS_SLAVE_AGENT_PORT=50000

#USER [jenkins]

COPY /backend/start.sh /bin
RUN chmod +x /bin/start.sh

EXPOSE 50000/tcp 8080/tcp

CMD ["/bin/start.sh"]
