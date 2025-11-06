# Quick Setup Guide

## Initial Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/joelfiddes/cv-markdown.git
   cd cv-markdown
   ```

2. **Install dependencies**
   ```bash
   # Install Pandoc
   brew install pandoc  # macOS
   # or
   sudo apt install pandoc  # Ubuntu
   
   # Chrome should be installed for PDF generation
   ```

3. **Update file paths**
   Edit the publish scripts and update paths:
   - Change `/Users/joel/` to your home directory
   - Update repository paths to match your setup

## Quick Commands

```bash
# Edit CV content
vim index.md

# Publish everything (HTML + PDF)
./publish.sh

# Manual PDF generation only
date=$(date +%Y-%m-%d)
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless --disable-gpu \
  --print-to-pdf=JoelFiddesCV_$date.pdf \
  --print-to-pdf-no-header \
  --virtual-time-budget=2000 \
  https://joelfiddes.github.io/cv/
```

## File Structure

- `index.md` - Main CV (no front matter)
- `index_main.md` - Alternative version (with front matter)
- `index_scienceVersion.md` - Science-focused version
- `media/cv-screen.css` - Web styles (active)
- `media/cv-print.css` - Print styles
- `_layouts/cv.html` - Jekyll template

## Key Features

- Multi-column layout for professional sections
- Chrome headless PDF generation
- Two-repository publishing workflow
- Multiple CV versions support