FROM unleashorg/unleash-server:6

ENV HTTP_PORT 8080
EXPOSE 8080

COPY ./scripts/load_secrets_and_run.sh load_secrets_and_run.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh", "./load_secrets_and_run.sh"]

CMD ["node", "index.js"]
