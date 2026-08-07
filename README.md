# TypeScript Katas Starter

Write tests in `tests/` (`*.spec.ts`), solutions in `app/`.

[Made Tech katas](https://learn.madetech.com/technology/katas/) ·
[TDD resources](https://learn.madetech.com/technology/core-skills/tdd/)

## Setup

Any one of these.

**mise** (recommended) — installs the pinned Bun:

```bash
curl https://mise.run | sh
mise trust && mise install && mise run test
```

**asdf** — plugins are not added automatically:

```bash
asdf plugin add bun && asdf install
```

**Container** — "Reopen in Container" in VS Code, or Codespaces. JetBrains IDEs
offer two routes: *Clone Sources* is faster on macOS and Windows but clones
inside the container, so it needs git credentials there and cannot reach a
private repo; *Mount Sources* always works. Or run it directly:

```bash
docker build -t typescript-katas . && docker run --rm typescript-katas
```

**Your own Bun** — [install it](https://bun.com/docs/installation), then:

```bash
bun install && bun test
```

- Script: `curl -fsSL https://bun.sh/install | bash`
- npm (the last `npm` command you'll ever need!): `npm install -g bun`
- macOS: `brew install oven-sh/bun/bun`
- Windows: `powershell -c "irm bun.sh/install.ps1|iex"`

## Commands

| | mise | direct |
| --- | --- | --- |
| Test | `mise run test` | `bun test` |
| Watch | `mise run watch` | `bun test --watch` |
| Coverage | `mise run coverage` | `bun test --coverage` |
| By pattern | | `bun test subtract` |

## Notes

- Bun reads `tsconfig.json` via `bunfig.toml`, including the `@/*` → `app/*`
  alias.
- Bun's test runner is Jest-like but not identical; see
  https://bun.sh/docs/test.
- Windows: use WSL or the devcontainer — the tasks assume a POSIX shell.
- Using this as a template? Delete `.github/dependabot.yml`.
