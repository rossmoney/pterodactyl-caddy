FROM caddy AS builder

ENV XDG_CONFIG_HOME /home/container/caddy/config
ENV XDG_DATA_HOME /home/container/caddy/data

USER container
ENV USER container
ENV HOME /home/container

WORKDIR /home/container

COPY ./Caddyfile.base /etc/caddy/Caddyfile
COPY ./entrypoint.sh /entrypoint.sh

COPY --from=builder /usr/local/bin/caddy ./caddy

CMD ["/bin/ash", "/entrypoint.sh"]
