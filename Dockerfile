FROM ubuntu:16.04

MAINTAINER Ying <wandy1208@gmail.com>

ENV ROOT_PASSWORD root

RUN apt-get -qqy update \
  && apt-get -qqy --no-install-recommends install \
    python2.7 \
    python-pip \
    python-openssl \
    libssl-dev \
    libffi-dev \
    wget \
    curl \
    unzip 

COPY scripts/ /home/seluser/exec/
##Robot env
# RUN pip install --upgrade pip \
#  && 
RUN pip install --upgrade setuptools \
 && pip install -Ur /home/seluser/exec/requirements.txt 

#ssh-server
RUN apt-get -qqy update \
  && apt-get -qqy install -y openssh-server \
        && mkdir /var/run/sshd \
        && echo "root:${ROOT_PASSWORD}" | chpasswd \
        && sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
        && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
        && rm -rf /var/cache/apk/* /tmp/*

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 22

ENTRYPOINT ["entrypoint.sh"]