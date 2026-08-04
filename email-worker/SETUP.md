# Lead Router — Setup Walkthrough

What this does: any email sent to `leads@digitalspectrumlabs.com` gets (1) forwarded straight
to your Gmail immediately, no matter what, and (2) logged as a file in the GitHub repo so
Claude can see new leads without needing access to your inbox. Free — the only cost in this
whole checklist is the domain itself, which you're buying anyway.

Do these in order. Each step says which account it needs.

## 1. Buy the domain (if not already done)
digitalspectrumlabs.com or .co.uk — via Cloudflare Registrar is easiest since you're about to
put it on Cloudflare anyway (no markup, sold at cost). Otherwise any registrar works, you'll
just point its nameservers at Cloudflare in the next step.

## 2. Add the domain to Cloudflare (free plan)
dash.cloudflare.com → Add a site → enter the domain → pick Free plan → Cloudflare gives you
two nameservers → set those at your registrar (skip this if you bought the domain through
Cloudflare directly, it's automatic).

## 3. Turn on Email Routing and verify your Gmail as a destination
Cloudflare dashboard → your domain → **Email** → Email Routing → Enable.
Add `movesmakemoves@gmail.com` as a destination address → Cloudflare emails you a
confirmation link → click it. This step is required before the Worker can forward anything
there.

## 4. Create a GitHub token scoped to just this one repo
github.com → click your profile photo → Settings → Developer settings → Personal access
tokens → **Fine-grained tokens** → Generate new token.
- Repository access: **Only select repositories** → pick the Digital Spectrum Labs repo
  (currently named `Izm-Studio`, may be renamed by the time you do this)
- Permissions → Contents → **Read and write**
- Generate, then copy the token somewhere safe — GitHub only shows it once. It starts with
  `github_pat_`.

This token can only touch that one repo, nothing else in your GitHub account.

## 5. Install the tools and log in
Open a terminal in this folder (`email-worker`) and run:
```bash
npm init -y
npm install postal-mime
npm install -D wrangler
npx wrangler login
```
The last command opens a browser tab asking you to authorize Wrangler against your
Cloudflare account — approve it.

## 6. Set the GitHub token as a secret
```bash
npx wrangler secret put GITHUB_TOKEN
```
Paste the token from step 4 when it asks, then press Enter. This keeps it out of the code
and out of git — it lives only in Cloudflare.

## 7. Check `wrangler.toml`
Open `wrangler.toml` in this folder. Make sure `GITHUB_REPO` matches the actual current repo
name (update it if the Izm-Studio → Digital-Spectrum-Labs rename has happened by now).

## 8. Deploy
```bash
npx wrangler deploy
```
This uploads the Worker to Cloudflare. It won't receive any email yet — one more step.

## 9. Point an email address at the Worker
Cloudflare dashboard → your domain → Email → Email Routing → Routing rules → Create address.
- Custom address: `leads@digitalspectrumlabs.com`
- Action: **Send to a Worker**
- Worker: `dsl-lead-router`
- Save

## 10. Test it
Send a real email (from any other email account you have) to `leads@digitalspectrumlabs.com`
with a subject and a short message, like a real enquiry. Within a minute or two, check:
- Your Gmail — the forwarded copy should be there.
- The GitHub repo — a new file should appear under `leads/inbox/` (refresh the repo page on
  github.com to see it, or just ask Claude to check).

If both show up, it's live. If only the Gmail forward shows up, the GitHub logging step
failed silently (email still isn't lost) — tell Claude and it'll check the Worker logs
(`npx wrangler tail`) to diagnose.

## 11. Last step — point the site at the new address
Once this is confirmed working, ask Claude to update the site's contact page to use
`leads@digitalspectrumlabs.com` instead of the temporary `movesmakemoves@gmail.com` that's
there now.
