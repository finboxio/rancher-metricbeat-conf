#! /bin/sh

METRICBEAT_DATA_DIR=${METRICBEAT_DATA_DIR:-/home/metricbeat}

while [[ ! -e /etc/rancher-conf/metricbeat.yml ]]; do
  echo "waiting for metricbeat configuration file"
  sleep 2
done

mkdir -p $METRICBEAT_DATA_DIR

exec /usr/local/bin/docker-entrypoint $@
