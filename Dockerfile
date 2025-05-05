FROM ubuntu:24.04 AS jenkins
LABEL build_date="2025-05-04"

RUN apt-get update && apt-get install apt-utils wget \
  apt-transport-https ca-certificates curl gnupg -y --no-install-recommends

# Install java17
RUN wget https://github.com/bell-sw/Liberica/releases/download/21.0.7%2B9/bellsoft-jdk21.0.7+9-linux-aarch64-full.deb
RUN apt-get install ./bellsoft-jdk21.0.7+9-linux-aarch64-full.deb -y
RUN rm bellsoft-jdk21.0.7+9-linux-aarch64-full.deb 

RUN update-alternatives --config javac
RUN update-alternatives --config java

RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key |  apt-key add -
RUN echo "deb https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list

RUN apt-get update && \
  apt-get install jenkins -y --no-install-recommends

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
