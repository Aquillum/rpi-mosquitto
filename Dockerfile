# Pull the base image
FROM raymondmm/pi-alpine:3.7
MAINTAINER Raymond Mouthaan <raymondmmouthaan@gmail.com>
ENV MOSQUITTO_VERSION 1.4.12-r0

RUN apk add --no-cache mosquitto
RUN mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log && chown mosquitto:mosquitto /mosquitto/*

COPY config /mosquitto/config
VOLUME ["/mosquitto"]

EXPOSE 1883 9001
CMD /usr/sbin/mosquitto -c /mosquitto/config/mosquitto.conf