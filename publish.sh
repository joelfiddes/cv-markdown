#!/bin/bash

# CV Markdown Publisher
# Generates HTML from markdown, publishes to website, and creates PDF

set -e  # Exit on any error

echo "🚀 Starting CV publication process..."

# Navigate to project directory
cd /Users/joel/src/jekyll/cv-markdown

# Step 1: Generate HTML from markdown using Pandoc with dynamic date
echo "📝 Generating HTML from markdown..."
current_date=$(date +"%B %Y")
sed "s/{{DATE_PLACEHOLDER}}/$current_date/g" index.md > temp_cv.md

pandoc --css=media/cv-screen.css -s -f markdown+smart \
       --metadata pagetitle="Joel Fiddes CV" \
       --to=html5 temp_cv.md \
       -o /Users/joel/src/jekyll/joelfiddes.github.io/cv/index.html

# Clean up temporary file
rm temp_cv.md

# Step 2: Copy CSS files to website
echo "🎨 Copying CSS files..."
cp media/cv-screen.css /Users/joel/src/jekyll/joelfiddes.github.io/cv/media/
cp media/cv-print.css /Users/joel/src/jekyll/joelfiddes.github.io/cv/media/

# Step 3: Commit source changes
echo "💾 Committing source changes..."
git add -A
git commit -m "cv edits - $(date +%Y-%m-%d)"
git push

# Step 4: Publish website
echo "🌐 Publishing website..."
cd /Users/joel/src/jekyll/joelfiddes.github.io
git add cv/
git commit -m "update cv - $(date +%Y-%m-%d)"
git push

# Step 5: Generate PDF
echo "📄 Generating PDF..."
cd /Users/joel/src/jekyll/cv-markdown
sleep 10  # Wait for website to update

"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless --disable-gpu \
  --print-to-pdf=JoelFiddesCV.pdf \
  --print-to-pdf-no-header \
  --virtual-time-budget=2000 \
  https://joelfiddes.github.io/cv/

echo "✅ Publication complete!"
echo "📄 PDF created: JoelFiddesCV.pdf"
echo "🌐 Website: https://joelfiddes.github.io/cv/"

