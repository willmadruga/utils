#!/usr/bin/env python

import time
import urllib2
import subprocess
from bs4 import BeautifulSoup

def main():
  target_value = 55
  url = "https://www.marketwatch.com/investing/stock/orcl"
  while (True):
    page = urllib2.urlopen(url)
    soup = BeautifulSoup(page, "html.parser")
    price = soup.find("bg-quote", attrs={"class":"value"})
    print float(price.text)
    if float(price.text) >= target_value:
      # Play the gong to remind me to sell :)
      play("./gong.mp3")
    time.sleep( 5 )

def play(audio_file_path):
  subprocess.call(["ffplay", "-nodisp", "-autoexit", audio_file_path])

if __name__ == "__main__": main()
