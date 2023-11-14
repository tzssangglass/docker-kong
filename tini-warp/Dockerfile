# load kong-ubuntu:latest
FROM kong/kong-gateway:latest-ubuntu

USER root

# add dumb-init
ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_x86_64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

COPY tini-wrapper.sh /tini-wrapper.sh

USER kong

# set tini as entrypoint
ENTRYPOINT ["/usr/local/bin/dumb-init", "--rewrite", "15:3", "--"]

CMD ["/tini-wrapper.sh"]
