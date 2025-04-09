FROM debian:bookworm-slim

RUN apt update && \
    apt install -y curl gnupg git unzip wget && \
    apt clean

RUN curl -L https://release.gensyn.network/testnet/gensyn-linux-x64 -o /usr/local/bin/gensyn && \
    chmod +x /usr/local/bin/gensyn

WORKDIR /app

CMD [ "gensyn", "node", "run" ]
