

cd ~/src/jekyll/cv-markdown/css
pandoc --css=cv-screen.css -s -f markdown+smart --metadata  pagetitle="joelfiddesCV" --to=html5 /home/joel/src/jekyll/cv-markdown/index.md -o /home/joel/src/jekyll/joelfiddes.github.io/cv/index.html
cp /home/joel/src/jekyll/cv-markdown/css/index.html /home/joel/src/jekyll/joelfiddes.github.io/cv/index.html
#use print config to make look nice eg margins minimum, scale custom

cd ~/src/jekyll/joelfiddes.github.io$
./gpush.sh


