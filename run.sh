#! /bin/bash

DATA_DIR=${DATA_DIR:-/usr/share/metricbeat/data}

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

METRICBEAT_OPTS=$(for var in "${!METRICBEAT_@}"; do printf -- "-E %s='%s' " $(echo "$var" | tr '_' '.' | tr '[:upper:]' '[:lower:]' | sed -e s/metricbeat.//) "${!var}"; done)

exec /usr/local/bin/docker-entrypoint -e --path.config=/etc/rancher-conf/metricbeat --path.data=$METRICBEAT_DATA_DIR $METRICBEAT_OPTS $@
