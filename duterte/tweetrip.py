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
print(sopas.findAll("div",{"class", "js-tweet-text-container"}))

i=1
for tweets in sopas.findAll("div",{"class", "js-tweet-text-container"}):
    print(i)
    print(tweets.find("p").text)
    i = i+1
