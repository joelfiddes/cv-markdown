#!/bin/bash

# Post-commit publish script - generates and publishes PDF without committing source changes
# (source changes are already committed by the time this runs)

set -e  # Exit on any error

echo "🚀 Starting CV publication process..."

# Step 1: Generate HTML from markdown
echo "📝 Generating HTML from markdown..."
pandoc --css=media/cv-screen.css -s -f markdown+smart \
       --metadata pagetitle="Joel Fiddes CV" \
       --to=html5 index.md \
       -o /Users/joel/src/jekyll/joelfiddes.github.io/cv/index.html

# Step 2: Copy CSS files to website (with error handling)
echo "🎨 Copying CSS files..."
if ! cp media/cv-screen.css /Users/joel/src/jekyll/joelfiddes.github.io/cv/media/ 2>/dev/null; then
    echo "⚠️  Could not copy cv-screen.css (might be permission issue)"
fi
if ! cp media/cv-print.css /Users/joel/src/jekyll/joelfiddes.github.io/cv/media/ 2>/dev/null; then
    echo "⚠️  Could not copy cv-print.css (might be permission issue)"
fi

# Step 3: Commit and push website changes  
echo "🌐 Publishing website changes..."
cd /Users/joel/src/jekyll/joelfiddes.github.io/cv/
git add -A
if git diff --staged --quiet; then
    echo "ℹ️  No website changes to commit"
else
    git commit -m "auto-update CV - $(date +%Y-%m-%d_%H-%M)"
    git push
fi

# Step 4: Generate PDF
echo "📄 Generating PDF..."
cd /Users/joel/src/jekyll/cv-markdown/
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
    --headless \
    --disable-gpu \
    --print-to-pdf=JoelFiddesCV_$(date +%Y-%m-%d).pdf \
    --print-to-pdf-no-header \
    --no-margins \
    https://joelfiddes.github.io/cv/

echo "✅ CV publication completed successfully!"
echo "📄 PDF: JoelFiddesCV_$(date +%Y-%m-%d).pdf"
echo "🌐 Website: https://joelfiddes.github.io/cv/"