#!/usr/bin/env bash

# Produces a `sitemap.xml` manifest from the contents of this repository.

set -euo pipefail

shopt -s globstar

# Start a new sitemap.xml file
cat > sitemap.xml <<EOT
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
EOT

for path in $(ls **/*.md \
  # Ignore the READMEs
  | grep -v README \
  | sed \
    # Strip extensions
    -e s:.md$:: \
    # Add the domain name root
    -e s@^@https://myrrlyn.net/@ \
    # And strip `index`
    -e s:/index$:: \
  | sort)
do
  cat >> sitemap.xml <<EOT
  <url>
    <loc>${path}</loc>
    <priority>0.7</priority>
  </url>
EOT
done

cat >> sitemap.xml <<EOT
</urlset>
EOT
