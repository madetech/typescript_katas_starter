# TypeScript Katas Starter (Bun only)

This repository runs entirely with Bun — no Node/Jest dependencies and no `npm install` required.

- Write test files in the `tests` directory (e.g., `*.spec.ts`).
- Write your kata solutions in the `app` directory.

## Suggested Katas

[A list of Made Tech Katas](https://learn.madetech.com/technology/katas/)

You can find TDD learning resources on our [Learn Tech site](https://learn.madetech.com/technology/core-skills/tdd/). 

## Prerequisites
- Install Bun: https://bun.com/docs/installation
  - Via script (see the Bun website for latest): `curl -fsSL https://bun.sh/install | bash`
  - npm (the last `npm` command you'll ever need!) - `npm install -g bun`
  - macOS (Homebrew): `brew install oven-sh/bun/bun`
  - Windows: `powershell -c "irm bun.sh/install.ps1 | iex"`

## Running tests (Bun)
- Run all tests
```sh
bun test
```

- Watch mode
```sh
bun test --watch
```

- Run a single test file (pattern)
```sh
bun test subtract
```

- Coverage
```sh
bun test --coverage
```

## Notes
- Bun uses tsconfig.json via bunfig.toml, including the `@/*` alias → `app/*`.
- No npm dependencies are required for testing; `package.json` has no devDependencies.
- Bun's test runner is similar to Jest but has some differences; see https://bun.sh/docs/api/test for details.
