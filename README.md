# Haza Aheli - EPK Website

Official Electronic Press Kit for Haza Aheli & The Hazayana Collective

A single-page EPK showcasing fusion dance performances, sacred bass music, and immersive workshop offerings for festival bookings worldwide.

## Live Site

`echological.fm/hazaaheli/epk/`

Hosted as a sub-path of Echological.fm, served by Caddy via Docker on the VPS.

## About

This single-page website serves as a professional press kit for **Haza Aheli**, an international performer blending:
- Tribal Fusion dance
- Sacred Bass music
- Fire performance art
- Immersive workshops
- Live percussion & didgeridoo

Featured at major festivals including Boom Festival, Burning Man, and Envision.

## Structure

```
.
├── index.html      # Main EPK page (single-page, no build step)
└── README.md
```

No build process — pure HTML/CSS/JS with CDN dependencies.

## Deployment

The EPK is hosted as a sub-directory of the Echological.fm site:

- **Deployed path on server:** `~/services/echological-fm/site/hazaaheli/epk/`
- **Caddy config:** served automatically by the `echological.fm` file_server block

To deploy updates:

```bash
# Copy source files to the services directory
cp index.html ~/services/echological-fm/site/hazaaheli/epk/
cp hero.png ~/services/echological-fm/site/hazaaheli/epk/   # if changed

# Reload Caddy (usually not needed for static file changes)
docker exec caddy caddy reload --config /etc/caddy/Caddyfile
```

> **Note:** The deployed version at `~/services/echological-fm/site/hazaaheli/epk/index.html`
> may differ from the source here — always sync changes back to this repo after editing.

## Technologies Used

- HTML5, CSS3, vanilla JavaScript
- Google Fonts (Oswald)
- No framework, no build step

## Local Development

```bash
python3 -m http.server 8000
# open http://localhost:8000
```

## Contact

For booking inquiries: `booking@echological.fm`
