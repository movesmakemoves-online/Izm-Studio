# Digital Spectrum Labs — Path to Launch

(renamed from Izm Media Services / Izm Studio — see design/what-we-built-and-why.md style notes if that history matters later)

## Done
- [x] Full site built: home, services, packages, work, about, contact
- [x] New brand: name, logo (prism/spectrum mark), full site rename
- [x] Growth & Marketing added as a 5th service line (SEO, email marketing, social retainers, CRM setup)
- [x] Monthly Retainer tier added to Packages, alongside Basic/Standard/Enhanced and Custom Web Applications
- [x] Committed to git, pushed to GitHub (currently under repo name "Izm-Studio" — needs renaming to match)
- [x] Deployed to Vercel (currently on a "Pro Trial" — needs migrating to Netlify instead, since Vercel's free tier bans commercial use and Netlify's allows it)

## What's left — grouped by what's needed from you

### To accept payments on the site
1. **Stripe account for Digital Spectrum Labs** (separate from the Hand Made By You one) — not created yet
2. **Pricing model decision**: confirmed — want *both* fixed-price checkout for standard packages AND a deposit option for custom/larger work. Not yet built — needs Stripe Payment Links once the account exists
3. **UK bank account** linked in Stripe for payouts — part of Stripe's own signup
4. **Legal business details** — registered business name (sole trader or limited company?), address — needed for Stripe compliance, not yet provided
5. **VAT status** — decided: not registering yet (turnover nowhere near the £90k threshold). Revisit if turnover approaches that.

### To make the site live and findable
6. **Domain name** (digitalspectrumlabs.com or .co.uk) — not yet purchased
7. **Business email** — decided: new dedicated address, not personal Gmail. Plan: free Cloudflare Email Routing forwarding to existing Gmail, set up once the domain exists (~5 min, £0 cost)
8. **Rename the GitHub repo** — go to github.com/movesmakemoves-online/Izm-Studio/settings,
   change the repo name field to `Digital-Spectrum-Labs`, click Rename
9. **Move hosting from Vercel to Netlify** (Vercel's free tier bans commercial use, Netlify's
   doesn't):
   - netlify.com → Sign up → Continue with GitHub
   - Add new site → Import an existing project → GitHub → select the (renamed) repo
   - Leave Build command blank, Publish directory `/` — it's a static site, nothing to build
   - Deploy

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
