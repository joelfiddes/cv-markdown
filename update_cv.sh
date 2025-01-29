#!/bin/bash

# Navigate to the CSS directory
cd ~/src/jekyll/cv-markdown/css || exit

# Convert Markdown to HTML using Pandoc
pandoc --css=cv-screen.css -s -f markdown+smart --metadata pagetitle="joelfiddesCV" \
       --to=html5 /home/joel/src/jekyll/cv-markdown/index.md \
       -o /home/joel/src/jekyll/joelfiddes.github.io/cv/index.html

# Copy the generated HTML to the destination directory
cp /home/joel/src/jekyll/cv-markdown/css/index.html /home/joel/src/jekyll/joelfiddes.github.io/cv/index.html

# Navigate to the GitHub Pages repository and push changes
cd ~/src/jekyll/joelfiddes.github.io || exit
./gpush.sh
