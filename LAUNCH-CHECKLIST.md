# Digital Spectrum Labs — Path to Launch

(renamed from Izm Media Services / Izm Studio — see design/what-we-built-and-why.md style notes if that history matters later)

## Done
- [x] Full site built: home, services, packages, work, about, contact
- [x] New brand: name, logo (prism/spectrum mark), full site rename
- [x] Growth & Marketing added as a 5th service line (SEO, email marketing, social retainers, CRM setup)
- [x] Monthly Retainer tier added to Packages, alongside Basic/Standard/Enhanced and Custom Web Applications
- [x] Services reordered site-wide: Websites/Apps/Games, AI for Business, Growth & Marketing, Video Production (renamed from Music Video & Film Editing), Graphic Design
- [x] Committed to git, pushed to GitHub (currently under repo name "Izm-Studio" — needs renaming to match)
- [x] Deployed to Vercel (currently on a "Pro Trial" — needs migrating to Netlify instead, since Vercel's free tier bans commercial use and Netlify's allows it)
- [x] **Fixed a real bug (2026-08-04): the contact form had no code behind it at all** — "Send Request" did nothing. Now wired as a Netlify Form (works automatically once deployed on Netlify, zero backend needed) with a JS fallback message if it ever fails. Also fixed the visible contact email, which pointed at hello@digitalspectrumlabs.com — a mailbox that doesn't exist yet since the domain isn't purchased — now points at movesmakemoves@gmail.com until real business email exists.
- [x] **Deployed to Netlify (2026-08-04)** — live at digitalspectrum.netlify.app, deploying from the GitHub repo. Made public (was gated behind Netlify's team-login wall at first). Form notifications wired to movesmakemoves@gmail.com and verified end-to-end with a real test submission — email arrived. The contact form is fully functional in production, not just in theory.

## What's left — grouped by what's needed from you

### To accept payments on the site
1. **Stripe account for Digital Spectrum Labs** (separate from the Hand Made By You one) — not created yet
2. **Pricing model decision**: confirmed — want *both* fixed-price checkout for standard packages AND a deposit option for custom/larger work. Not yet built — needs Stripe Payment Links once the account exists
3. **UK bank account** linked in Stripe for payouts — part of Stripe's own signup
4. **Legal business details** — registered business name (sole trader or limited company?), address — needed for Stripe compliance, not yet provided
5. **VAT status** — decided: not registering yet (turnover nowhere near the £90k threshold). Revisit if turnover approaches that.

### To make the site live and findable
6. **Domain name** (digitalspectrumlabs.com or .co.uk) — not yet purchased
7. **Business email + automatic lead capture** — built 2026-08-04, not deployed yet:
   `email-worker/` in this project folder is a real Cloudflare Email Worker that forwards
   `leads@digitalspectrumlabs.com` to your Gmail (nothing lost) AND logs each lead as a file
   in the GitHub repo (`leads/inbox/`) so Claude can see new leads without inbox access —
   built this way specifically because Gmail and the Netlify/Cloudflare dashboards are
   blocked from Claude's browser automation, so GitHub is the one place that actually works.
   Full walkthrough: `email-worker/SETUP.md` — needs the domain (below) first, then ~15 min
   of one-time setup. £0 cost beyond the domain itself.
8. **Rename the GitHub repo** — go to github.com/movesmakemoves-online/Izm-Studio/settings,
   change the repo name field to `Digital-Spectrum-Labs`, click Rename. (Netlify's deploy
   source will need repointing to the new repo URL after — check Netlify still builds
   correctly once this is done, GitHub renames usually auto-redirect but worth confirming.)
9. ~~Move hosting from Vercel to Netlify~~ — **done 2026-08-04**, see above.

### Content — in progress
10. **Real portfolio content** — done for Hand Made By You and Little VIPs (added as real,
    honestly-labeled "in development" case studies). Flyer design, CD covers, and AI
    integration samples still placeholder — add when available.
11. **About page** — rewritten with a real founder story (20+ years media background,
    "needed it for myself, now sharing it") — currently marked as a placeholder draft in
    the HTML for you to edit with concrete specifics when ready.
12. **Team/founder photo** — flagged: an AI-generated *illustrative* image is fine to use;
    an AI image presented as a literal photo of a specific real person or team that
    doesn't exist risks misleading-advertising territory. Real photo is the safest bet
    when you have one.

## What's NOT blocking launch
Design, copy, structure, all 5 services, and all 4 package tiers are real and ready.
The site could go live (on a free subdomain, no custom domain yet) as soon as #8 is
done. Payments (#1-5) and the custom domain (#6-7) can follow once you've gathered
the account details above — none of it blocks getting the site itself live and
viewable.
