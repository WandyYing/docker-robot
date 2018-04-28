FROM ubuntu:16.04

LABEL description="Docker image for the Robot Framework http://robotframework.org/ modified"
LABEL usage=" "

# Set timezone to Europe/Helsinki and install dependencies
#   * git & curl & wget
#   * python
#   * xvfb
#   * chrome
#   * chrome selenium driver
#   * hi-res fonts

RUN apt-get -yqq  update \
    && apt-get upgrade -yqq \
    && apt-get install -y \
    apt-utils \
    sudo \
    tzdata \
    python-pip \
    python-setuptools \
    unzip \
    wget \
    curl 

# Fix hanging Chrome, see https://github.com/SeleniumHQ/docker-selenium/issues/87
ENV DBUS_SESSION_BUS_ADDRESS /dev/null
ENV DISPLAY=:99

# Install Robot Framework libraries
COPY scripts/ /tmp/exec/
WORKDIR /tmp/exec/
RUN pip install --upgrade pip
RUN pip install -Ur requirements.txt && rm requirements.txt