
# Dockerfile for docker image of RunDeck
# https://github.com/bhalothia/docker-rundeck
# RunDeck plugins from https://github.com/rundeck-plugins

FROM ubuntu
MAINTAINER Felipe Machado <felipe@linea.gov.br>
RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 git
RUN apt-get install openjdk-8-jdk -y
RUN apt-get install -y openssh-client uuid-runtime

ADD http://dl.bintray.com/rundeck/rundeck-deb/rundeck_2.10.8-1-GA_all.deb /tmp/rundeck.deb

ADD prerequisites/ /

RUN dpkg -i /tmp/rundeck.deb &&\
    rm /tmp/rundeck.deb &&\
    chown rundeck:rundeck /tmp/rundeck &&\
    chmod u+x /opt/entrypoint.sh &&\
    mkdir -p $RDECK_BASE/.ssh &&\
    chown rundeck:rundeck $RDECK_BASE/.ssh

# Start rundeck
ENTRYPOINT ["/opt/entrypoint.sh"]
