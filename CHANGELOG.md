# Changelog

All notable changes to this project will be documented in this file.

## [2025-11-06] - Multi-Column Layout Fix & Chrome PDF

### Added
- Chrome headless PDF generation for better CSS support
- Comprehensive documentation in README.md
- AI coding assistant instructions in `.github/copilot-instructions.md`
- .gitignore file to prevent repository clutter
- Archive directory for test files

### Changed
- **BREAKING**: Switched from wkhtmltopdf to Chrome headless for PDF generation
- Updated publish scripts to use Chrome instead of wkhtmltopdf
- Fixed hardcoded paths from `/home/joel/` to `/Users/joel/`
- Restored original CSS with `columns: 3` syntax for multi-column layout

### Fixed
- Multi-column layout now works properly in both web and PDF versions
- H1 color restored to orange (#F07415)
- CSS syntax errors that prevented column layout
- Header alignment issues in professional sections

### Removed
- Multiple test PDF files (moved to archive)
- Unused CSS directory and old files
- NEW_README.md and sample files
- System files (.DS_Store)

### Technical Details
- Multi-column layout controlled by CSS `ul { columns: 3; }` rule
- Chrome headless command: `--headless --disable-gpu --print-to-pdf --print-to-pdf-no-header`
- Professional sections (memberships, reviewer, languages, countries) display in 3 columns
- Two-repository publishing workflow: source → website → PDF generation

## [2023-11-17] - Previous Version
- Last working version before multi-column layout issues
- Used wkhtmltopdf for PDF generation

## [2022-11-23] - Earlier Version
- Basic Jekyll workflow established