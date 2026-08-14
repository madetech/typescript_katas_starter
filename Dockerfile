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
# The global default matters: `dotnet`, `python` etc. on PATH are mise shims,
# and a shim resolves its version from config in scope of the *current working
# directory*. IDE language servers shell out from outside the workspace (VS
# Code's C# BuildHost runs from ~/.vscode-server), where no project config
# applies, so the shim would fail and the IDE would conclude no SDK exists.
# Seeding the global default from this project's own resolved versions makes
# shims work from any directory. A project config still takes precedence.
RUN mise trust && mise install \
 && mise use -g $(mise ls --current --offline | awk '{print $1 "@" $2}' | tr '\n' ' ')

# Your working copy is supplied at runtime: bind-mounted by the devcontainer, or
# by `docker run -v "$PWD":/workspace` (see the README).
CMD ["mise", "run", "test"]
