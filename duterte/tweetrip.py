# ee
# 2016-12-18

## LIBRARIES
import urllib
import urllib.request
from bs4 import BeautifulSoup




## SCRAPE TWEETS
our_url = "https://twitter.com/search?q=duterte&src=typd"
webpage = urllib.request.urlopen(our_url)
sopas = BeautifulSoup(webpage, "html.parser")




## PARSING HTML
# <p class="TweetTextSize  js-tweet-text tweet-text" lang="en" data-aria-label-part="0">
print(sopas.title.text)
print(sopas.text)
print(sopas.findAll("p"))

print(sopas.find("TweetTextSize"))
