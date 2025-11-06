# CV Markdown - Academic CV Generator

A Jekyll-based academic CV generator that converts markdown CVs to HTML and publishes to GitHub Pages with automatic PDF generation.

> **✨ Auto-publishing enabled**: PDF generation and publishing happens automatically after every commit via Git hooks. Last tested: $(date).

## 🎯 Overview

This project maintains multiple CV versions for different contexts and generates professional PDFs with proper multi-column layout for professional sections.

## 📋 Features

- **Multiple CV versions**: Different versions for academic, consulting, and science-focused contexts
- **Automatic publishing**: One-command workflow to update website and generate PDF
- **Professional layout**: Multi-column layout for professional sections
- **Modern CSS**: Responsive design with Font Awesome icons and Google Fonts
- **PDF generation**: High-quality PDF output with preserved formatting

## 📁 Project Structure

```
├── index.md                 # Main CV (published to website)
├── _layouts/cv.html         # Jekyll template  
├── media/                   # Active CSS files
│   ├── cv-screen.css        # Web styles
│   └── cv-print.css         # Print/PDF styles
├── publish.sh               # Single publishing workflow script
├── _config.yml              # Jekyll configuration
└── archive/                 # Archived files and alternative CV versions
    ├── index_main.md        # Alternative CV version (general)
    └── index_scienceVersion.md  # Alternative CV version (science-focused)
```

## 🚀 Quick Start

### Prerequisites

- Pandoc (for markdown to HTML conversion)
- Google Chrome (for PDF generation)
- Git access to your GitHub Pages repository

Note: Jekyll is no longer required as we use Pandoc for HTML generation.

### Generate PDF

```bash
# Single command to publish everything
./publish.sh
```

This script will:
1. Generate HTML from `index.md` using Pandoc
2. Copy CSS files to the website repository  
3. Commit and push source changes
4. Publish to the live website
5. Generate PDF using Chrome headless

### Manual PDF generation

```bash
# Current best method using Chrome headless
date=$(date +%Y-%m-%d)
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless --disable-gpu \
  --print-to-pdf=JoelFiddesCV_$date.pdf \
  --print-to-pdf-no-header \
  --virtual-time-budget=2000 \
  https://joelfiddes.github.io/cv/
```

## 📝 Content Guidelines

### CV Structure

The CV uses markdown with specific formatting conventions:

- **Headers**: Use `## Section Name` for main sections
- **Dates**: Use backticks for date ranges: `` `2009-13` ``
- **Institutions**: Use `__double underscores__` for emphasis
- **Links**: Use descriptive HTML links: `<a href="url">description</a>`
- **Icons**: Use Font Awesome in contact section: `<i class="fa fa-envelope"></i>`

### Multi-Column Sections

The following sections automatically display in 3-column layout:
- Professional memberships
- Reviewer for
- Languages  
- Country experience

This is controlled by the CSS rule in `media/cv-screen.css`:
```css
ul {
  columns: 3;
  -webkit-columns: 3;
  -moz-columns: 3;
}
```

## 🔧 Development

### Publishing Workflow

The project uses a unique two-repository setup:

1. **Source repository**: `cv-markdown` (this repo)
2. **Website repository**: `joelfiddes.github.io/cv/`

Publishing process:
1. Build HTML from markdown (Jekyll or Pandoc)
2. Copy generated files to website repository
3. Commit and push both repositories
4. Generate PDF from live website

### CSS Architecture

- **Active styles**: `media/` directory
- **Web layout**: `cv-screen.css` - includes multi-column layout
- **Print layout**: `cv-print.css` - optimized for PDF generation
- **Reset-based**: Uses CSS reset for consistent cross-browser rendering

### PDF Generation

**Chrome headless** is used instead of wkhtmltopdf for better CSS support:

- ✅ **Chrome**: Full CSS3 support including `columns`, flexbox, grid
- ❌ **wkhtmltopdf**: Poor support for modern CSS features

## 🎨 Customization

### Adding New CV Versions

1. Copy existing version (e.g., `index_main.md`)
2. Update Jekyll front matter:
   ```yaml
   ---
   layout: cv
   title: Your CV Title
   ---
   ```
3. Modify content as needed
4. Update publish scripts to use different source files

### Styling Changes

- **Web styles**: Edit `media/cv-screen.css`
- **Print styles**: Edit `media/cv-print.css`
- **Template**: Edit `_layouts/cv.html`

### Color Scheme

- **Primary headers**: Orange (#F07415)
- **Secondary headers**: Green (#37b81a) 
- **Code/dates**: Gray (#aaa)

## 📚 Dependencies

- **Jekyll**: Static site generator with kramdown markdown
- **Pandoc**: Alternative markdown processor
- **Google Chrome**: PDF generation via headless mode
- **Font Awesome**: Icons in contact section
- **Google Fonts**: Open Sans font family

## 🐛 Troubleshooting

### Common Issues

1. **PDF missing columns**: Use Chrome headless instead of wkhtmltopdf
2. **CSS not updating**: Ensure both source and website CSS files are updated
3. **Git conflicts**: Pull latest changes before pushing
4. **Jekyll not found**: Install Jekyll: `gem install jekyll bundler`

### File Paths

Update hardcoded paths in scripts for different users:
- Change `/Users/joel/` to your home directory
- Update repository paths in publish scripts

## 📖 Documentation

- **AI Coding Assistant**: See `.github/copilot-instructions.md`
- **Original Blog Post**: [Markdown Academic CV](http://blm.io/blog/markdown-academic-cv/) by Ben Moore

## 📄 License

See `LICENSE` file.

## 🔗 Links

- **Live CV**: https://joelfiddes.github.io/cv/
- **Source Repository**: https://github.com/joelfiddes/cv-markdown
- **Website Repository**: https://github.com/joelfiddes/joelfiddes.github.io

# Original instructions

### How to run

A (jekyll-based) markdown CV tweaked slightly from the great design by [elipapa](https://github.com/elipapa/markdown-cv) (see their [blog post](http://www.eliseopapa.org/workflow/2012/09/20/why-i-switched-to-markdown-for-my-cv/)).

To build, clone the repo and run jekyll:

```bash
git clone git://github.com/blmoore/md-cv
cd md-cv/
jekyll serve
```

Then point your browser at [0.0.0.0:4000](0.0.0.0:4000).

### HTML version

The HTML version is generated by Jekyll under `_site` using `media/cv-screen.css`. Most changes from the original repo are artificial:

* fixed horizontal scrolling issue caused by lots of funky CSS positioning (lots of `left` etc.)
* messed with colours, fonts
* now imports font-awesome icons and Open sans
* moved `ul` into 3-col layout (iirc following [another markdown cv](https://github.com/davidhampgonsalves/resume) I tried)

### PDF version

Note the separate CSS for print and screen media (see `media/cv-print.css`), my approach was to build a somewhat "jazzy" html version and a toned-down print version (for PDF). My changes introduce CSS3 columns in some sections which currently don't print to PDF under the blink/webkit engines (as of March 2015), so to print properly I suggest firefox.

Another problem with the PDF is pagebreaks, they're often not handled gracefully so I've added one in explicitly. Say you want a pagebreak before the section titled "education" (`h2` text is set to `id` so use unique section headers!), the print media CSS would be:

```CSS
#education {
	page-break-before: always;
}
```
