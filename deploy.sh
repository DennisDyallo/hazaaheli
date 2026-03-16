#!/bin/bash
set -euo pipefail

SERVICES_DIR="$HOME/services"
SITE_DIR="$SERVICES_DIR/echological-fm/site/hazaaheli/epk"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Deploying to $SITE_DIR..."
mkdir -p "$SITE_DIR"
cp "$SCRIPT_DIR/index.html" "$SCRIPT_DIR/hero.png" "$SITE_DIR/"

echo "==> Reloading Caddy..."
docker exec caddy caddy reload --config /etc/caddy/Caddyfile 2>/dev/null || echo "    (Caddy reload skipped — container not running locally)"

echo "==> Done. Deployed echological.fm/hazaaheli/epk/"
ls -lh "$SITE_DIR/index.html"
