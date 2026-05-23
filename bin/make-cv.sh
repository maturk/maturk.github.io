#!/usr/bin/env bash
# Regenerate cv.pdf from cv.html.
# cv.html is now a Jekyll-templated page (pulls publications from _data/papers.yml
# where cv-feature: true), so we build the site first and print the rendered output.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
RENDERED="$ROOT/_site/cv.html"
OUTPUT="$ROOT/cv.pdf"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

if [[ ! -x "$CHROME" ]]; then
  echo "error: Chrome not found at $CHROME" >&2
  exit 1
fi

echo "building site..."
(cd "$ROOT" && bundle exec jekyll build --quiet)

if [[ ! -f "$RENDERED" ]]; then
  echo "error: $RENDERED not found after build" >&2
  exit 1
fi

"$CHROME" \
  --headless=new \
  --disable-gpu \
  --no-pdf-header-footer \
  --virtual-time-budget=2000 \
  --print-to-pdf="$OUTPUT" \
  "file://$RENDERED" >/dev/null 2>&1

echo "wrote $OUTPUT ($(du -h "$OUTPUT" | cut -f1))"
