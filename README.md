# md-cv

## How to use
My markdown CV, which currently looks something like [this](https://joelfiddes.github.io/cv/), see this [blog post](http://blm.io/blog/markdown-academic-cv/) from Ben Moore for details.

### Update content
Content:
```
~/src/jekyll/cv-markdown/index.md
```
Style:
```
~/src/jekyll/cv-markdown/media
```

### Commit edits
```
git add -A
git commit -m "CV edits"
git push
```

### Publish to CV website
Example script to generate HTML and push to local gh-pages directory. This builds the html from markdown and copies to :

~/src/jekyll/joelfiddes.github.io/cv

```
cd ~/src/jekyll/cv-markdown
./publish.sh
```

### Push website live
```
cd ~/src/jekyll/joelfiddes.github.io
./gpush.sh # quick commit of website
```

### Check it out
```
https://joelfiddes.github.io/cv/
```

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
