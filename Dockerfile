# Pull the base image
FROM raymondmm/rpi-alpine:3.7
MAINTAINER Raymond Mouthaan <raymondmmouthaan@gmail.com>

ENV MOSQUITTO_VERSION 1.4.14-r3

RUN apk update && apk upgrade
RUN apk add mosquitto
RUN export VERSION='apk info mosquitto -d | grep mosquitto | sed "s/^.*mosquitto-\([^ d]*\).*/\1/"'
RUN mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log && chown mosquitto:mosquitto /mosquitto/*

COPY config /mosquitto/config
VOLUME ["/mosquitto"]

EXPOSE 1883 9001
CMD /usr/sbin/mosquitto -c /mosquitto/config/mosquitto.conf
