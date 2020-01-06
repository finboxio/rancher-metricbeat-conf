FROM finboxio/rancher-conf-aws:v0.4.2

COPY config.toml /etc/rancher-conf/
COPY metricbeat.yml.tmpl /etc/rancher-conf/

COPY run.sh /opt/rancher/bin/
