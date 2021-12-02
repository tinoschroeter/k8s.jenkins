FROM ubuntu:groovy AS jenkins
LABEL build_date="2021-12-01"

RUN apt update && apt-get install apt-utils wget apt-transport-https \
ca-certificates curl gnupg -y --no-install-recommends

# Install java11
RUN wget https://github.com/bell-sw/Liberica/releases/download/11.0.11%2B9/bellsoft-jdk11.0.11+9-linux-aarch64.deb
RUN apt-get install ./bellsoft-jdk11.0.11+9-linux-aarch64.deb -y
RUN rm bellsoft-jdk11.0.11+9-linux-aarch64.deb

RUN update-alternatives --config javac
RUN update-alternatives --config java

RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key |  apt-key add -

RUN echo "deb https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list

RUN apt-get update && \
rm -rf /var/lib/apt/lists/*

RUN apt-get install jenkins -y --no-install-recommends

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
