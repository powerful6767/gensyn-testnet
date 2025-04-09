FROM debian:bullseye-slim

# Install dependencies
RUN apt update && \
    apt install -y curl gnupg git unzip wget && \
    apt clean

# Download and install Gensyn binary
RUN curl -L https://release.gensyn.network/testnet/gensyn-linux-x64 -o /usr/local/bin/gensyn && \
    chmod +x /usr/local/bin/gensyn

# Set working directory
WORKDIR /app

# Start the node
CMD ["gensyn", "node", "run"]
