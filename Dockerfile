FROM docker:dind

COPY src/ /galoy/
COPY images/ /images/
COPY entrypoint.sh /entrypoint.sh

WORKDIR /galoy

ARG GALOY_CLI_VERSION=0.1.4
ARG GALOY_CLI_SHASUM=7b4f21094ba0f6e5dc706eeb542fc93aac459fcc9b49fde37787331900ad348c
RUN wget https://github.com/GaloyMoney/galoy-cli/releases/download/${GALOY_CLI_VERSION}/galoy-cli-x86_64-unknown-linux-musl-${GALOY_CLI_VERSION}.tar.gz \
  && echo $GALOY_CLI_SHASUM galoy-cli-x86_64-unknown-linux-musl-${GALOY_CLI_VERSION}.tar.gz | sha256sum -c \
  && tar -zxvf galoy-cli-x86_64-unknown-linux-musl-${GALOY_CLI_VERSION}.tar.gz \
  && mv galoy-cli-x86_64-unknown-linux-musl-${GALOY_CLI_VERSION}/galoy-cli /usr/local/bin \
  && chmod +x /usr/local/bin/galoy-cli \
  && rm galoy-cli-x86_64-unknown-linux-musl-${GALOY_CLI_VERSION}.tar.gz

ENTRYPOINT ["/entrypoint.sh"]
