# Example script to generate HTML and push to local gh-pages directory.

#build site from markdown
jekyll build

# remove old files
rm -R ../joelfiddes.github.io/cv/*

# re-add new
cp _site/index.html ../joelfiddes.github.io/cv/.
cp -R _site/media ../joelfiddes.github.io/cv/.

# commit
git add -A
git commit -m "cv edits"
git push

cd ~/src/jekyll/joelfiddes.github.io
./gpush.sh # quick commit of website

# make pdf
date=$(date +%Y-%m-%d)
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless --disable-gpu --print-to-pdf=/Users/joel/src/jekyll/cv-markdown/JoelFiddesCV_$date.pdf --print-to-pdf-no-header --virtual-time-budget=2000 https://joelfiddes.github.io/cv/

