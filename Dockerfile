FROM finboxio/rancher-conf-aws:v1.3.1

VOLUME /etc/rancher-conf/metricbeat

ADD config.toml /etc/rancher-conf/
ADD metricbeat.yml.tmpl /etc/rancher-conf/
ADD modules.yml.tmpl /etc/rancher-conf/

ADD run.sh /opt/rancher/bin/
ADD setup.sh /etc/rancher-conf/
