#! /bin/bash

METRICBEAT_DATA_DIR=${METRICBEAT_DATA_DIR:-/usr/share/metricbeat/data}

while [[ ! -e /etc/rancher-conf/metricbeat/metricbeat.yml ]]; do
  echo "waiting for metricbeat configuration file"
  sleep 2
done

mkdir -p $METRICBEAT_DATA_DIR &>/dev/null

me=$(whoami)
if [[ "$me" == "root" ]]; then
  chown -R root:root /etc/rancher-conf/metricbeat/metricbeat.yml
  chown -R root:root $METRICBEAT_DATA_DIR
fi

exec /usr/local/bin/docker-entrypoint $@
