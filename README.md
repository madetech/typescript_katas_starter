# TypeScript Katas Starter

Write tests in `tests/` (`*.spec.ts`), solutions in `app/`.

[Made Tech katas](https://learn.madetech.com/technology/katas/) ·
[TDD resources](https://learn.madetech.com/technology/core-skills/tdd/)

## Setup

Any one of these.

**mise** (recommended) — installs the pinned Node:

```bash
curl https://mise.run | sh
mise trust && mise install && mise run test
```

**asdf** — plugins are not added automatically:

```bash
asdf plugin add nodejs && asdf install
```

**Container** — "Reopen in Container" in VS Code, or Codespaces; JetBrains IDEs
offer the same from the `devcontainer.json` gutter icon. Give your container
runtime at least 4GB of memory — a smaller default will get the IDE language
server killed mid-session. Or run the tests directly:

```bash
docker build -t typescript-katas . && docker run --rm -v "$PWD":/workspace typescript-katas
```

If `devcontainer.json` or the `Dockerfile` changes, rebuild the container
("Dev Containers: Rebuild Container" in VS Code). Pulling alone will not pick
up container changes.

**Your own Node** — 24+, then:

```bash
npm install && npx vitest run
```

## Commands

| | mise | direct |
| --- | --- | --- |
| Test | `mise run test` | `npx vitest run` |
| Watch | `mise run watch` | `npx vitest` |
| Coverage | `mise run coverage` | `npx vitest run --coverage` |
| Type-check | `mise run typecheck` | `npx tsc --noEmit` |
| One file | | `npx vitest run sum` |

## Notes

- Tests use [Vitest](https://vitest.dev). `globals: true` in `vitest.config.ts`
  is why `describe`/`it`/`expect` need no import.
- Tests import solutions as `@/sum`, aliased to `app/` in `vitest.config.ts`
  and `tsconfig.json`. Both need to agree if you change it.
- `mise run typecheck` runs `tsc`; Vitest itself does not type-check.
- Windows: use WSL or the devcontainer — the tasks assume a POSIX shell.
- Using this as a template? Delete `.github/dependabot.yml`.
