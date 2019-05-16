FROM rabbitmq:3.7.14-management
MAINTAINER Pierre Letessier

RUN apt update -y && apt install -y curl

ENV base_url='https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download/v3.7.2.4'

RUN cd /opt/rabbitmq/plugins/ && \
    curl -LO "${base_url}/accept-0.3.3.ez" && \
    curl -LO "${base_url}/prometheus-3.5.1.ez" && \
    curl -LO "${base_url}/prometheus_cowboy-0.1.4.ez" && \
    curl -LO "${base_url}/prometheus_httpd-2.1.8.ez" && \
    curl -LO "${base_url}/prometheus_rabbitmq_exporter-3.7.2.4.ez" && \
    rabbitmq-plugins enable --offline prometheus_rabbitmq_exporter