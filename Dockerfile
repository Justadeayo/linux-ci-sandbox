FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    ca-certificates \
    curl \
    git \
    jq \
    openssl \
    rsync \
    zstd \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
COPY scripts/ /workspace/scripts/
RUN chmod +x /workspace/scripts/*.sh

CMD ["/bin/bash"]
