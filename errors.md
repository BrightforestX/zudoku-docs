# Errors — zudoku

Error handling for Zudoku framework and documentation sites.

## Error handling strategy

- **Build errors** — Fail fast; clear Vite/MDX error output.
- **Plugin errors** — Throw and extend `ZudokuError`; log with context.
- **Runtime errors** — User-facing fallbacks; log for debugging.

## Error catalog

| Condition           | Handling                         | Runbook                    |
| ------------------- | -------------------------------- | -------------------------- |
| Site down (404/500) | Check GitHub Actions, Cloudflare | [RUNBOOK.md](RUNBOOK.md)   |
| Deployment failed   | Rollback; revert and push        | [RUNBOOK.md](RUNBOOK.md)   |
| MDX parse error     | Fix source; rebuild              | Check MDX syntax           |
| Plugin load failure | Verify plugin config             | [pages/docs/](pages/docs/) |

## See also

- [RUNBOOK.md](RUNBOOK.md)
