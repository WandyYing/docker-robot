FROM python:2.7.14-alpine3.7

MAINTAINER Ying <wandy1208@gmail.com>

ENV ROOT_PASSWORD root

RUN apk add --update --no-cache \
    curl \
    unzip 


##Robot env
RUN pip install -U \
    pip \
    robotframework==3.0.2 \
    robotframework-selenium2library==1.8.0 \
    selenium>=3.0.0 \
    robotframework-pabot \
    robotframework-ftplibrary \
    reportportal-client \
    robotframework-reportportal-ng \
    pyyaml \
    python --version

COPY scripts/ /home/seluser/exec/


#ssh-server
RUN apk --update add openssh \
        && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
        && echo "root:${ROOT_PASSWORD}" | chpasswd \
        && rm -rf /var/cache/apk/* /tmp/*

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 22

ENTRYPOINT ["entrypoint.sh"]