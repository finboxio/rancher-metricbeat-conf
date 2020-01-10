METRICBEAT_DATA_DIR="/usr/share/metricbeat/data"
if [[ "$EBS_VOLUME_NAME" != "" ]]; then
  if [[ "$EBS_VOLUME_DIR" != "" ]]; then
    METRICBEAT_DATA_DIR=${EBS_VOLUME_DIR}
  else
    METRICBEAT_DATA_DIR=/ebs/${EBS_VOLUME_NAME}
  fi
fi

if [[ "$METRICBEAT_USER_ID" != "" ]]; then
  userdel metricbeat &>/dev/null
  adduser -u $METRICBEAT_USER_ID metricbeat -D

  mkdir -p $METRICBEAT_DATA_DIR &>/dev/null
  chown -R metricbeat:metricbeat $METRICBEAT_DATA_DIR

  chown -R metricbeat:metricbeat /etc/rancher-conf/metricbeat
fi
