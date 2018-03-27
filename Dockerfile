FROM openjdk:jre-alpine
MAINTAINER Ying <wandy1208@gmail.com>

RUN apk add --update --no-cache \
    python \
    python-dev \
    py-pip

RUN pip install -U \
    pip \
    robotframework>=3.0.2 \
    robotframework-seleniumlibrary>=3.0.0 \
    selenium>=3.0.0 \
    robotframework-ftplibrary
