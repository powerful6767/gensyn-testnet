FROM debian:bookworm-slim

# Use Cloudflare DNS to avoid Render DNS failures
RUN echo "nameserver 1.1.1.1" > /etc/resolv.conf

# Install dependencies
RUN apt update && \
    apt install -y curl gnupg git unzip wget && \
    apt clean

# Retry downloading gensyn binary up to 5 times
RUN bash -c 'for i in {1..5}; do \
    curl -fsSL https://release.gensyn.network/testnet/gensyn-linux-x64 -o /usr/local/bin/gensyn && break || sleep 2; \
    done' && \
    chmod +x /usr/local/bin/gensyn

# Set working directory
WORKDIR /app

# Run the node
CMD [ "gensyn", "node", "run" ]
