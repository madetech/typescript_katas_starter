# TypeScript Katas Starter

- Write test files in the `tests` directory (e.g., `*.spec.ts`).
- Write your kata solutions in the `app` directory.

## Suggested Katas

[A list of Made Tech Katas](https://learn.madetech.com/technology/katas/)

You can find TDD learning resources on our [Learn Tech site](https://learn.madetech.com/technology/core-skills/tdd/).

## Getting started

Pick whichever of these suits your machine. All three end up running the same
tests with the same Bun version.

### 1. With mise (recommended)

[mise](https://mise.jdx.dev/) installs the exact Bun version this repo is
pinned to, so you don't have to think about it.

```bash
curl https://mise.run | sh
```

Then, in this directory:

```bash
mise trust && mise install && mise run test
```

`asdf` users can use `.tool-versions` instead. asdf does not add plugins
automatically, so add them once first:

```bash
asdf plugin add bun && asdf install
```

### 2. In a container (nothing installed locally)

Open the repo in VS Code and choose **Reopen in Container**, or open it in
GitHub Codespaces. The `.devcontainer` builds the toolchain for you.

To just run the tests once in Docker:

```bash
docker build -t typescript-katas . && docker run --rm typescript-katas
```

### 3. With your own Bun

Install Bun: https://bun.com/docs/installation

- Via script (see the Bun website for latest): `curl -fsSL https://bun.sh/install | bash`
- npm (the last `npm` command you'll ever need!) - `npm install -g bun`
- macOS (Homebrew): `brew install oven-sh/bun/bun`
- Windows: `powershell -c "irm bun.sh/install.ps1|iex"`

Then install the type definitions and run the tests:

```bash
bun install
bun test
```

## Running tests

| What | mise | Plain |
| --- | --- | --- |
| All tests once | `mise run test` | `bun test` |
| Watch mode | `mise run watch` | `bun test --watch` |
| A single test file (pattern) | — | `bun test subtract` |
| Coverage | `mise run coverage` | `bun test --coverage` |

## Notes

- Bun uses tsconfig.json via bunfig.toml, including the `@/*` alias → `app/*`.
- Bun's test runner is similar to Jest but has some differences; see https://bun.sh/docs/test for details.
- `mise.toml` is the single source of truth for the Bun version. CI and the
  Dockerfile both read it, so there is one place to bump.
- **On Windows**, use WSL or the devcontainer. The `mise run` tasks assume a
  POSIX shell, so they will not work as-is in PowerShell or cmd.
- **Using this as a template?** Delete `.github/dependabot.yml` from your copy
  unless you want monthly dependency PRs on a throwaway kata repo.
