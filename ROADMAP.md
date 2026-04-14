# Docs roadmap

**Scope:** `tools/zudoku/docs` (Zudoku documentation site).  
**Priority (suggested):** P0 PathX.ai content → P1 Zuplo monetization → P2 widget discovery + Wave
AI.  
**Last updated:** 2026-04-03.

**Checkbox convention:** Parent `- [ ]` epic stays open until the epic is shippable; nested items
are **sub-features** you can complete independently. Reference IDs in issues/PRs (`PX-1.2`, `ZUP-6`,
`WDG-3.1`).

---

## PX — PathX.ai domain (`ZUDOKU_PUBLIC_DOMAIN=pathx-ai`)

**Goal:** PathX-branded dev runs (`pnpm run dev:pathx-ai`) surface accurate docs, including Waveterm
/ data-platform material.

**Out of scope:** Changing default non-PathX nav unless explicitly decided repo-wide.

### PX-1 — Waveterm (data platform)

- [ ] **PX-1.0** Document the Waveterm app from the unified data platform monorepo so it appears
      when running `pnpm run dev:pathx-ai --port 3333` (and the matching build script).
  - [ ] **PX-1.1** Discover the app in-repo: purpose, run instructions, env vars, ports,
        dependencies, and how it fits the data platform (source:
        `unified-data-platform/apps/waveterm`, README + scripts + entrypoints).
  - [ ] **PX-1.1b** **Content source of truth:** Port or reconcile documentation from the Waveterm
        docs tree at `unified-data-platform/apps/waveterm/docs/docs` (full path on disk:
        `/Users/clifforddalsoniii/Documents/Brightforest/projects/services/data-platform/unified-data-platform/apps/waveterm/docs/docs`)
        so that material lives on this Zudoku docs site—not only as a separate app bundle. Treat
        that folder as the inventory to merge, rewrite, or replace; do not leave equivalent
        user-facing docs only outside Zudoku.
  - [ ] **PX-1.2** Add MDX under `pages/docs/` (e.g. `roadmap/sites` or a dedicated PathX.ai /
        data-platform section) following existing Zudoku MDX patterns. **Presentation:** Use this
        site’s **Zudoku components** (shared MDX components, layout, callouts, cards, etc.) and
        **styling tokens** (Tailwind/theme as used elsewhere in `docs/`) so ported pages match the
        rest of the docs shell—avoid dropping in Waveterm-only HTML/CSS that bypasses Zudoku.
  - [ ] **PX-1.3** Wire the page into `sidebar.ts` so it is reachable from the nav.
  - [ ] **PX-1.4** Cross-link from existing PathX.ai content (e.g.
        `pages/docs/roadmap/sites/pathx-ai.mdx`) where it helps discovery.
  - [ ] **PX-1.5** Smoke-test: `pnpm run dev:pathx-ai --port 3333` — new route(s) render; default
        `pnpm run dev` / `pnpm run build` still work if env is unset (unless the repo standardizes
        on always setting the domain).

---

## ZUP — Zuplo API monetization (Developer Portal)

**Goal:** Pricing in the developer portal, Stripe checkout, plan-scoped keys, metering, and gateway
enforcement per Zuplo’s flow.

**Link:** [Quickstart — Monetize Your API](https://zuplo.com/docs/articles/monetization/quickstart)
(Zuplo docs; beta).

**Out of scope:** Storing Stripe secrets in this repo’s `.env` (configure in Zuplo only).

### ZUP — Zuplo console + gateway (sequential)

- [ ] **ZUP-0** **Prerequisites:** Zuplo account; Stripe account (test/sandbox mode is fine).
- [ ] **ZUP-1** **New project:** [portal.zuplo.com](https://portal.zuplo.com) → New Project →
      Starter Project (recommended); optional GitHub connect.
- [ ] **ZUP-2** **Portal docs config (Zuplo project):** **Code** → `docs/zudoku.config.tsx` →
      `import { zuploMonetizationPlugin } from "@zuplo/zudoku-plugin-monetization"` → add
      `zuploMonetizationPlugin()` to `plugins` → save and let deploy finish.
- [ ] **ZUP-3** **Monetization Service:** **Services** tab → pick environment (e.g. Working Copy) →
      **Configure** on **Monetization Service**.
- [ ] **ZUP-4** **Meter:** Meters → Add **Blank Meter** (example: Name `Requests`, Event `requests`,
      Aggregation `SUM`, Value Property `$.total`).
- [ ] **ZUP-5** **Features:** Add features (e.g. `requests` linked to Requests meter; `monthly_fee`;
      `metadata_support`) — **metered feature keys must match meter keys**.
- [ ] **ZUP-6** **Plans:** Create and publish plans (see nested checklist).
  - [ ] **ZUP-6.1** Create **Developer** plan (key `developer`): rate cards for monthly fee + tiered
        API requests + soft limit as in quickstart.
  - [ ] **ZUP-6.2** Duplicate/rename to **Pro** (key `pro`): adjust pricing, included requests,
        overage; add **Metadata Support** (free + boolean entitlement).
  - [ ] **ZUP-6.3** **Pricing Table:** drag order (e.g. Developer then Pro).
  - [ ] **ZUP-6.4** **Publish** each plan (draft → published).
- [ ] **ZUP-7** **Stripe:** Stripe Dashboard (test mode) → Secret key `sk_test_...` → Monetization
      Service → **Payment Provider** → Stripe → paste key (**never commit**; lives in Zuplo only).
- [ ] **ZUP-8** **Gateway policy:** **Code** → `config/policies.json` → **Monetization** inbound
      policy (`MonetizationInboundPolicy`, `meters.requests: 1` or as needed) → **Apply** to routes
      → **Save** project.
- [ ] **ZUP-9** **E2E test:** Portal **Pricing** URL → subscribe with
      [Stripe test cards](https://stripe.com/docs/testing) → call API with issued key → confirm
      usage in dashboard.

### ZUP — Local `docs` site (this repo)

| Variable                       | Required?                     | Where                                                                                                                            |
| ------------------------------ | ----------------------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `ZUPLO_PUBLIC_DEPLOYMENT_NAME` | **Yes** (for monetization UI) | `docs/.env` — deployment name from Zuplo (same environment you configured). `@zuplo/zudoku-plugin-monetization` throws if unset. |
| `ZUPLO_GATEWAY_SERVICE_URL`    | No                            | Optional in `docs/.env`; defaults to `https://api.zuploedge.com` in the plugin.                                                  |
| `ZUDOKU_PUBLIC_DOMAIN`         | No (domain theming)           | Set by `pnpm run dev:pathx-ai` / `build:pathx-ai` scripts.                                                                       |
| Stripe secret                  | N/A in `.env`                 | Zuplo **Monetization Service → Payment Provider** only.                                                                          |

- [ ] **ZUP-L1** Copy `docs/.env.example` → `docs/.env` and set `ZUPLO_PUBLIC_DEPLOYMENT_NAME`.
- [ ] **ZUP-L2** Confirm `docs/vite.config.ts` includes `ZUPLO_PUBLIC_` in `envPrefix` (Vite exposes
      vars for local `zudoku dev`).
- [ ] **ZUP-L3** Register `zuploMonetizationPlugin()` in `docs/zudoku.config.tsx` `plugins` when you
      want pricing UI locally (mirrors Zuplo quickstart Step 2).
- [ ] **ZUP-L4** `pnpm install` at monorepo root so `@zuplo/zudoku-plugin-monetization` resolves.

### ZUP — Risks / dependencies

- Workspace **zudoku `workspace:*`** may diverge from **zudoku 0.73.x** expected by the monetization
  package; align versions or follow Zuplo if dev/build breaks.
- **Enforcement** is on the **API gateway** (policy), not only the docs site.

---

## WDG — Widget discovery: search menu + Wave AI

**Goal:** Users find the right Zudoku / site widgets via search; **Wave AI** interprets natural
language and returns **relevant** widgets (not only a static list).

**Out of scope (until specified):** Choosing a single Wave AI product URL/SDK — document in
**WDG-3.1** once chosen.

### WDG-1 — Search menu widget

- [ ] **WDG-1.0** Ship a dedicated UI widget: **search menu over all registered (or curated)
      widgets**.
  - [ ] **WDG-1.1** Entry point: trigger control + panel/modal pattern consistent with docs shell.
  - [ ] **WDG-1.2** Typeahead / debounced input; loading state.
  - [ ] **WDG-1.3** Keyboard: open, navigate results, select, dismiss (a11y: focus trap, ARIA).
  - [ ] **WDG-1.4** Empty, error, and timeout states.

### WDG-2 — Widget index / registry

- [ ] **WDG-2.0** Maintain a **machine-readable index** (id, title, description, tags, route or
      embed id) for ranking and filtering.
  - [ ] **WDG-2.1** Define schema and storage location (e.g. JSON under `docs/` or generated at
        build).
  - [ ] **WDG-2.2** Process to keep registry in sync when new widgets ship (manual checklist in PR
        template and/or CI guard).
  - [ ] **WDG-2.3** Optional: include doc headings/snippets in index for hybrid search.

### WDG-3 — Wave AI search execution

- [ ] **WDG-3.0** **Wave AI** runs NL queries → structured search against the widget index (and
      optionally docs).
  - [ ] **WDG-3.1** Choose integration (API base URL, auth); document **non-secret** config; add
        placeholders to `docs/.env.example` (no committed secrets).
  - [ ] **WDG-3.2** Client or BFF: send user query → receive ranked widget ids + optional rationale.
  - [ ] **WDG-3.3** Map responses to registry entries; handle malformed AI output safely.

### WDG-4 — Relevance surfacing + fallbacks

- [ ] **WDG-4.0** Results UI shows **why** items matched (snippet, tags, section) and **open
      widget** / deep-link behavior.
  - [ ] **WDG-4.1** If Wave AI fails or times out, **fallback** to local / keyword search over the
        same index (offline-capable menu).
  - [ ] **WDG-4.2** Tests or manual script: empty query, typo tolerance, **golden queries** with
        expected top widgets.

---

## Notes

- Domain-specific behavior uses `ZUDOKU_PUBLIC_DOMAIN` (see `package.json` scripts and
  `zudoku.config.tsx`). MCP landing and API reference share that key; sidebar/content stay shared
  unless branched in config.
- See `docs/.env.example` for Zuplo + optional domain placeholders.
- **Main roadmap URL:** Use `/docs/roadmap/index` in MDX (or `/docs/roadmap`, which redirects). The
  sitemap and prerendered routes use the `index` path.
- **Zuplo / 401 in local dev:** `zuploMonetizationPlugin()` is not registered in `zudoku.config.tsx`
  by default. If you add it, set `ZUPLO_PUBLIC_DEPLOYMENT_NAME` in `docs/.env`; otherwise Zuplo
  calls may return **401** (e.g. user/deployment not found).
