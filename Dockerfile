FROM timberio/vector:0.12.2-alpine

COPY crontab /cron.script
RUN crontab /cron.script
COPY commands.sh /commands
RUN chmod +x /commands
RUN apk add --update npm
RUN apk add --no-cache bash
RUN apk add jq
COPY ghec-audit-log-cli /ghec-audit-log-cli
COPY vector.toml /etc/vector/vector.toml
WORKDIR /ghec-audit-log-cli
RUN chmod +x pull-logs.sh
RUN npm link
RUN ./pull-logs.sh
ENTRYPOINT ["/commands"]