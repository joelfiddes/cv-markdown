# CV Markdown Project - AI Coding Assistant Instructions

## Project Overview
This is a Jekyll-based CV website generator that converts markdown CVs to HTML and publishes to GitHub Pages. The project maintains multiple CV versions for different contexts (academic, consulting, science-focused).

## Key Architecture

### Content Structure
- **Primary CV**: `index.md` (no front matter) - main version published to website
- **Alternative versions**: `index_main.md`, `index_scienceVersion.md` (with Jekyll front matter)
- **Layout**: `_layouts/cv.html` - single template with Font Awesome icons and Google Fonts
- **Styling**: `media/cv-screen.css` (web), `media/cv-print.css` (PDF generation)

### Publishing Workflow
Two distinct publishing approaches exist:

1. **Jekyll-based** (`publish.sh`):
   ```bash
   jekyll build → copy _site/ → commit → push → generate PDF
   ```

2. **Pandoc-based** (`publish_NEW.sh`):
   ```bash
   pandoc index.md → direct HTML → commit → push → generate PDF
   ```

**Critical**: The project publishes to a separate repository (`joelfiddes.github.io/cv/`) via file copying, not standard Jekyll deployment.

## Development Patterns

### File Organization
- `media/` and `css/` directories contain similar files - `media/` is the active styling location
- Generated files go to `_site/` (Jekyll) but are copied to external GitHub Pages repo
- PDF generation uses `wkhtmltopdf` from live website URL

### CV Content Conventions
- Use Font Awesome icons in contact section: `<i class="fa fa-envelope"></i>`
- Date ranges in backticks: `` `2009-13` ``
- Institution names in `__double underscores__` for emphasis
- External links with descriptive text: `<a href="url">description</a>`

### CSS Architecture
- Reset-based CSS with custom styling for academic CV layout
- Separate print/screen stylesheets for optimal PDF generation
- Uses Open Sans font family via Google Fonts CDN

## Critical Workflows

### Publishing Changes
Always run the appropriate publish script after content changes:
```bash
./publish.sh        # Jekyll workflow (current default)
./publish_NEW.sh    # Pandoc workflow (alternative)
```

### Adding New CV Versions
1. Copy existing version (e.g., `index_main.md`)
2. Update Jekyll front matter with appropriate title
3. Modify content as needed
4. Manual switching required in publish scripts to use different source files

### Styling Updates
- Modify files in `media/` directory (not `css/`)
- Test both screen and print versions
- Verify PDF output after publishing live

## External Dependencies
- Jekyll with kramdown markdown processor
- `wkhtmltopdf` for PDF generation from live website
- External GitHub Pages repository for hosting
- Font Awesome and Google Fonts CDNs

## Common Gotchas
- The main `index.md` has no Jekyll front matter (intentional for current workflow)
- PDF generation depends on live website, so publish sequence matters
- Two sets of CSS files exist - use `media/` for active styles
- Hardcoded paths in scripts reference `/home/joel/` - update for different users