# Toolchain is driven entirely by mise.toml — bump language versions there, never here.
# This file is byte-identical in every Made Tech katas starter.
FROM debian:bookworm-slim AS toolchain

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
      build-essential ca-certificates curl git libffi-dev libicu72 \
      libssl-dev libyaml-dev unzip xz-utils zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

ENV MISE_DATA_DIR=/usr/local/mise \
    MISE_CACHE_DIR=/usr/local/mise/cache \
    MISE_INSTALL_PATH=/usr/local/bin/mise \
    PATH=/usr/local/mise/shims:$PATH
RUN curl -fsSL https://mise.run | sh

WORKDIR /workspace
COPY mise.toml .tool-versions ./
RUN mise trust && mise install

# The devcontainer stops at `toolchain` above and bind-mounts your working copy.
# The default stage below bakes the code in, so `docker run` runs the katas' tests.
FROM toolchain AS test
COPY . .
RUN mise trust
CMD ["mise", "run", "test"]
