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

## Deploy (Cloudflare Pages)

1. In the [Cloudflare dashboard](https://dash.cloudflare.com/) go to **Workers & Pages** → **Create** → **Pages** → **Connect to Git**.
2. Select the **BrightforestX/zudoku-docs** repository (install the Cloudflare GitHub app on the org if prompted).
3. Configure the build:

   | Setting | Value |
   |--------|--------|
   | **Framework preset** | None |
   | **Root directory** | `/` (repository root) |
   | **Build command** | `pnpm run build:pages` |
   | **Build output directory** | `dist` |

4. Set **Environment variables** (recommended):

   | Variable | Value |
   |----------|--------|
   | `NODE_VERSION` | `22` |

   Optional: set `ZUDOKU_PUBLIC_DOMAIN` (e.g. `pathx-ai`) if you use domain-scoped MCP OpenAPI like `pnpm run build:pathx-ai` locally.

5. Save and deploy. Production builds use `build:pages`, which runs `git submodule update --init --recursive` before `zudoku build` so the `brightpath_swarm` submodule is present. If the submodule repo is **private**, grant the Cloudflare GitHub app access to that repository as well.

`wrangler.toml` in this repo documents `pages_build_output_dir` for CLI deploys (`npx wrangler pages deploy dist --project-name=zudoku-docs`) and can be aligned with the dashboard per [Wrangler configuration for Pages](https://developers.cloudflare.com/pages/functions/wrangler-configuration/).

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
