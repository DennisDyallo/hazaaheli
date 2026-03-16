# Haza Aheli

Official web presence for Haza Aheli & The Hazayana Collective, hosted under Echological.fm.

## Live Routes

| URL | Description |
|-----|-------------|
| `echological.fm/hazaaheli/` | Full interactive website with Gemini AI features |
| `echological.fm/hazaaheli/epk/` | Condensed Electronic Press Kit |

## Structure

```
hazaaheli/
├── index.html      # Interactive site (Gemini AI Vision Alchemist, charts, tabs)
├── hero.png        # Background image for main site
├── epk/
│   ├── index.html  # Condensed press kit (bio, offerings, booking, contact)
│   └── hero.png    # Background image for EPK
├── deploy.sh       # Deployment script
└── README.md
```

No build process — pure HTML/CSS/JS with CDN dependencies (Tailwind, Chart.js, Google Fonts, Gemini API).

## Deployment

Hosted as a sub-path of Echological.fm, served by Caddy via Docker on the VPS.

- **Site files:** `~/services/echological-fm/site/hazaaheli/`
- **Caddy config:** `~/services/caddy/Caddyfile` (served by the `echological.fm` file_server block)

To deploy:

```bash
./deploy.sh
```

Copies both `index.html` + `hero.png` and `epk/` to `~/services/echological-fm/site/hazaaheli/`.

## Local Development

```bash
python3 -m http.server 8000
# Main site: http://localhost:8000
# EPK:       http://localhost:8000/epk/
```

## Contact

For booking inquiries: `booking@echological.fm`
