#!/usr/bin/env bash
# Usage: ./set-owner.sh <github-username>   — points og:image/twitter:image at GitHub Pages
set -euo pipefail; O="$1"; B="https://$O.github.io/site-previews"
for f in */index.html; do d=$(dirname "$f")
  sed -i -E "s#(<meta (property|name)=\"(og|twitter):image\" content=\")[^\"]*og-image\.jpg\"#\1$B/$d/og-image.jpg\"#" "$f"
done; grep -H 'og:image"\|twitter:image' */index.html
