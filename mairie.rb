require 'rubygems'
require 'nokogiri'
require 'open-uri'


PAGE_URL = "http://annuaire-des-mairies.com/95/vaureal.html"
#url du premier exo
PAGE_URL2 = "http://annuaire-des-mairies.com/val-d-oise.html"
#url du second exo


def get_the_email_of_a_townhall_from_its_webpage(mailcheck) #def de la methode
doc = Nokogiri::HTML(open(mailcheck))
doc.xpath('//p[@class="Style22"]').each do |email| #ciblé l'email dans la class et appliquer un each do
  if email.text.include? "@" #si l'email contient un @, ecrire email
    email.text
    puts email.text
    end
  end
end


def get_all_the_urls_of_val_doise_townhalls(linkcheck) #def de la fonction
page = Nokogiri::HTML(open(linkcheck))
page.css("a.lientxt").each do |link| #ciblé le lien url de la ville
link['href'] = link['href'][1..-1] #concatené l'url pour l'étape d'après en retirant le "."
mailcheck = "http://annuaire-des-mairies.com" + link['href'] #construction de l'url
puts mailcheck
get_the_email_of_a_townhall_from_its_webpage(mailcheck) #appel de la fonction email pour scrapper les emails de chaque ville
end
end


get_all_the_urls_of_val_doise_townhalls(PAGE_URL2)
