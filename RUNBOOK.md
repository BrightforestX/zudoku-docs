# Incident Runbook

<!-- Workflow trigger update -->

## Site Down (404 or 500 Errors)

### Symptoms

- Users report site not loading
- Monitoring alerts from UptimeRobot

### Steps

1. **Check GitHub Actions**:
   - Go to repo → Actions tab
   - Look for recent workflow runs on the affected branch
   - Check for build/test failures

2. **Check Cloudflare Dashboard**:
   - Workers & Pages → Select project
   - Check deployment status
   - View recent deployments

3. **Rollback if needed**:

   ```bash
   cd ../worktrees/<domain>
   git checkout <branch>
   git revert HEAD
   git push origin <branch>
   ```

4. **If DNS issue**:
   - Check GoDaddy DNS records
   - Verify CNAME points to correct pages.dev URL
   - Propagation time: 5-30 minutes

## Deployment Failed

### Symptoms

- GitHub Actions workflow red
- No deployment to Cloudflare

### Steps

1. **View workflow logs**:
   - Click the failed run
   - Check which stage failed (build, test, deploy)

2. **Common fixes**:
   - **pnpm install failure**: Clear pnpm cache in workflow
   - **Build failure**: Check Node version, dependencies
   - **Test failure**: Review Playwright/Lighthouse logs in artifacts
   - **Deploy failure**: Check Cloudflare secrets, project name

3. **Retry**:
   - Push a dummy commit to trigger re-run
   - Or manually re-run from Actions tab

## PR Preview Not Working

### Symptoms

- PR comment not posted
- No preview URL

### Steps

1. **Check PR base branch**:
   - Must target production branch (not staging)
   - Update base branch if needed

2. **Check workflow trigger**:
   - PR must target one of the 13 production branches
   - Check Actions tab for workflow run

3. **Check permissions**:
   - Ensure GITHUB_TOKEN has pull-requests:write permission

## Lighthouse Score Drop

### Symptoms

- Workflow fails on Lighthouse job
- Score < 90 in any category

### Steps

1. **Download artifacts**:
   - Actions → Lighthouse results artifact
   - Review detailed report

2. **Common causes**:
   - Large images: Optimize with Cloudflare Polish
   - Slow JS: Minify, lazy load
   - Missing meta tags: Add Open Graph, Twitter cards
   - Accessibility: Add alt text, ARIA labels

3. **Fix and re-run**:
   - Make changes, push to PR
   - Workflow re-runs automatically

## DNS Propagation Delay

### Symptoms

- Site not live after deployment
- dig shows old IP

### Steps

1. **Verify deployment**:
   - Cloudflare Dashboard shows successful deploy
   - Preview URL works

2. **Check DNS**:

   ```bash
   dig brightpath.ai
   dig staging.brightpath.ai
   ```

3. **Wait**:
   - GoDaddy DNS propagation: 5-30 minutes
   - Cloudflare full propagation: up to 24 hours (rare)

4. **Flush cache**:
   - Browser: Ctrl+Shift+R
   - Local: `ipconfig /flushdns` (Windows) or `sudo dscacheutil -flushcache` (Mac)

## Secrets Expired

### Symptoms

- Deploy fails with auth error
- "Invalid API token"

### Steps

1. **Regenerate Cloudflare token**:
   - Cloudflare Dashboard → My Profile → API Tokens
   - Create new token with Pages edit permission

2. **Update GitHub Secrets**:
   - Repo Settings → Secrets → Actions
   - Update `CLOUDFLARE_API_TOKEN`

3. **Test**:
   - Push a small change to trigger deploy

## Contact

- GitHub Issues: [BrightforestX/zudoku/issues](https://github.com/BrightforestX/zudoku/issues)
- Email: Your GitHub notifications
- Monitoring: UptimeRobot alerts
