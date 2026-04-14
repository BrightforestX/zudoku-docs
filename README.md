# Zudoku documentation site

Standalone repository containing the documentation app that used to live under `docs/` in [BrightforestX/zudoku](https://github.com/BrightforestX/zudoku). History for these files was extracted with `git subtree split -P docs`.

## Prerequisites

- Node 20+ or 22+
- [pnpm](https://pnpm.io) 10+

## Clone

```bash
git clone --recurse-submodules https://github.com/BrightforestX/zudoku-docs.git
cd zudoku-docs
```

If you already cloned without submodules:

```bash
git submodule update --init --recursive
```

## Develop

```bash
pnpm install
pnpm dev
```

## Build

```bash
pnpm build
pnpm preview
```

## Framework dependency

This package depends on the published [`zudoku`](https://www.npmjs.com/package/zudoku) npm package (pinned in `package.json`). If you need unpublished changes from the monorepo fork, point `devDependencies.zudoku` at a git URL or local path and reinstall.

## Updating from the monorepo

To refresh this tree from `BrightforestX/zudoku` after editing `docs/` there:

```bash
cd /path/to/zudoku
git subtree split -P docs -b zudoku-docs-export
cd /path/to/zudoku-docs
git fetch /path/to/zudoku zudoku-docs-export
git merge --ff-only FETCH_HEAD   # or merge/rebase as you prefer
```
