# Mosquitto
# This service uses a host mount point to a nfs share
docker service create \
--name Mosquitto \
--no-resolve-image \
--publish 1883:1883 \
--publish 9001:9001 \
--replicas 1 \
--detach=true \
--mount type=bind,source=/mnt/nfs-share-2/mosquitto,target=/mosquitto \
--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
--mount type=bind,source=/etc/timezone,target=/etc/TZ,readonly \
raymondmm/rpi-mosquitto:latest
