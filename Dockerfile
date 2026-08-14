# Toolchain is driven entirely by mise.toml — bump language versions there, never here.
# This file is byte-identical in every Made Tech katas starter.
#
# Deliberately a single stage. A multi-stage build would need `--target` in
# devcontainer.json, and JetBrains' "Clone Sources" flow rejects that flag.
FROM debian:bookworm-slim

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
# Also seed a global default: shims resolve their version from the current
# directory's config, and IDE language servers run outside the repo. A project
# config still takes precedence.
RUN mise trust && mise install \
 && mise use -g $(mise ls --current --offline | awk '{print $1 "@" $2}' | tr '\n' ' ')

# Your working copy is supplied at runtime: bind-mounted by the devcontainer, or
# by `docker run -v "$PWD":/workspace` (see the README).
CMD ["mise", "run", "test"]
