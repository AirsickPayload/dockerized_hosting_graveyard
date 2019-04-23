FROM fluent/fluentd:latest
RUN gem install fluent-plugin-elasticsearch fluent-plugin-loggly net-http-persistent:2.9
COPY ./fluent.conf /fluentd/etc/fluent.conf