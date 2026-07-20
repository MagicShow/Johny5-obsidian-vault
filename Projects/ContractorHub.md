# ContractorHub — Project Notes

## Overview
AI-powered estimating app for blue-collar contractors (remodeling, painting, flooring, drywall). $499/month SaaS.

**Live:** https://collar-blue.vercel.app

**Stack:** React 18 + Vite (frontend), Express Node.js (backend), plain CSS

---

## Architecture

### Frontend (Vercel)
- Repo: `MagicShow/collar-blue`
- URL: https://collar-blue.vercel.app
- Auto-deploys from `master` branch
- VITE_API_URL should point to Railway backend URL

### Backend (Railway)
- Repo: `MagicShow/collar-blue` (server/ directory)
- Railway app: collar-blue-production
- URL: https://collar-blue-production.up.railway.app
- Start command: `node src/index.js` (from server/ root)
- Root directory in Railway dashboard: `/server`

---

## Features

### ScopeBot
- Conversational AI interview (7 questions)
- Auto-detects when scope is complete
- GPT-4o powered, contractor persona

### Visual Generation
- DALL-E 3 generates scope imagery
- Used in proposal documents

### Quote Engine
- 3-tier pricing: Basic (+15-25%), Standard (+35-50%), Premium (+60-80%)
- Margin rules built in
- GPT-4o powered

### Email Bid
- SMTP email delivery of proposals
- Mock fallback when SMTP not configured
- Sends to client email

---

## Environment Variables

### Railway (backend)
```
OPENAI_API_KEY=sk-...        # Required for AI features
PORT=3001                     # Auto-set by Railway
NODE_ENV=production
```

### Vercel (frontend)
```
VITE_API_URL=https://collar-blue-production.up.railway.app
```

---

## Security
- Secret scanning: ✅ enabled on GitHub
- CORS: needs lockdown before launch (origin whitelist)
- Rate limiting: needed on AI endpoints
- Input validation: needed (Zod)
- Prompt injection sanitization: ✅ in backend

---

## Pre-Launch Todo
- [ ] Verify OPENAI_API_KEY set in Railway
- [ ] Set VITE_API_URL in Vercel
- [ ] CORS lockdown (set allowed origins)
- [ ] Rate limiting on /api/scope and /api/generate
- [ ] Input validation with Zod
- [ ] Auth (Clerk or Supabase) — blocks Stripe
- [ ] Stripe billing at $499/mo
- [ ] Cloudinary for real image uploads
- [ ] PDF generation (@react-pdf/renderer installed)
- [ ] Persistent DB (Neon PostgreSQL + Prisma) — Phase 2

---

## Design System (refreshed 2026-07-18)
- Primary: #1D6AFF (saturated confident blue)
- Accent: #0EA472 (green success)
- File: design-system.md in repo
