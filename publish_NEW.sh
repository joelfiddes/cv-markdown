cd ~/src/jekyll/cv-markdown/css

#m make htm;
pandoc --css=cv-screen.css -s -f markdown+smart --metadata  pagetitle="joelfiddesCV" --to=html5 /Users/joel/src/jekyll/cv-markdown/index.md -o /Users/joel/src/jekyll/joelfiddes.github.io/cv/index.html

# remove old files from website dir
#rm -R ../joelfiddes.github.io/cv/*

# re-add new html
#cp /home/joel/src/jekyll/cv-markdown/css/index.html /home/joel/src/jekyll/joelfiddes.github.io/cv/index.html
# and css
#cp -R _site/media ../joelfiddes.github.io/cv/.

# commit cv edits
git add -A
git commit -m "cv edits"
git push

# push website
cd ~/src/jekyll/joelfiddes.github.io
./gpush.sh # quick commit of website

# make pdf
date=$(date +%Y-%m-%d)
wkhtmltopdf https://joelfiddes.github.io/cv/ /home/joel/src/jekyll/cv-markdown/JoelFiddesCV_$date.pdf


/Users/joel/src/jekyll/cv-markdown/index.md