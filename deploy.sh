#!/bin/bash
set -euo pipefail

SERVICES_DIR="$HOME/services"
SITE_DIR="$SERVICES_DIR/echological-fm/site/hazaaheli"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Deploying main site to $SITE_DIR..."
mkdir -p "$SITE_DIR"
cp "$SCRIPT_DIR/index.html" "$SCRIPT_DIR/hero.png" "$SITE_DIR/"

echo "==> Deploying EPK to $SITE_DIR/epk/..."
mkdir -p "$SITE_DIR/epk/en" "$SITE_DIR/epk/sv"

# EPK root redirects to English version
cp "$SCRIPT_DIR/epk/redirect.html" "$SITE_DIR/epk/index.html"

# English and Swedish versions use the same HTML (auto-detects language from URL)
cp "$SCRIPT_DIR/epk/index.html" "$SITE_DIR/epk/en/index.html"
cp "$SCRIPT_DIR/epk/hero.png" "$SITE_DIR/epk/en/hero.png"
cp "$SCRIPT_DIR/epk/index.html" "$SITE_DIR/epk/sv/index.html"
cp "$SCRIPT_DIR/epk/hero.png" "$SITE_DIR/epk/sv/hero.png"

echo "==> Reloading Caddy..."
docker exec caddy caddy reload --config /etc/caddy/Caddyfile 2>/dev/null || echo "    (Caddy reload skipped — container not running locally)"

echo "==> Done."
echo "    echological.fm/hazaaheli/        -> $(ls -lh "$SITE_DIR/index.html" | awk '{print $5}')"
echo "    echological.fm/hazaaheli/epk/en/ -> $(ls -lh "$SITE_DIR/epk/en/index.html" | awk '{print $5}')"
echo "    echological.fm/hazaaheli/epk/sv/ -> $(ls -lh "$SITE_DIR/epk/sv/index.html" | awk '{print $5}')"
