#methode corrigé suite à bug, intégration de la boucle for et rappel dans le each.do

require 'rubygems'
require 'nokogiri'
require 'open-uri'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"


def get_crypto(mailcheck) #def de la methode
crypto = Hash.new{|k,v| k[v]=""} #creation du hash
doc = Nokogiri::HTML(open(mailcheck))
for i in (1..1448) #boucle pour chercher chaque valeur
doc.xpath("//tr[#{i}]/td[2]/a").each do |coin| #organiser les monnaies et rappel de i
doc.xpath("//tr[#{i}]/td[5]/a").each do |price| # organiser les prix et rappel de i
     crypto[coin.text] = price.text # lier les monnaies aux prix
    end
  end
end
  puts crypto #appeler le hash
end


get_crypto(PAGE_URL)


------------------------------------------------------------------


require 'rubygems'
require 'nokogiri'
require 'open-uri'

PAGE_URL = "https://coinmarketcap.com/all/views/all/"


def get_crypto(mailcheck) #def de la methode
crypto = Hash.new{|k,v| k[v]=""} #creation du hash
doc = Nokogiri::HTML(open(mailcheck))
doc.xpath('//a[@class="currency-name-container"]').each do |coin| #organiser les monnaies
doc.xpath('//a[@class="price"]').each do |price| # organiser les prix
     crypto[coin.text] = price.text # lier les monnaies aux prix
    end
  end
  puts crypto #appeler le hash
end


get_crypto(PAGE_URL)
