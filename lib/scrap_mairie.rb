require 'nokogiri'
require 'open-uri'

def scrap_mairie_ville
  # Définition de l'URL à scraper
  url = "https://www.annuaire-mairie.fr/ville-argenteuil.html"

  # Récupération du HTML de la page
  html = URI.open(url)

  # Parsing du HTML avec Nokogiri
  doc = Nokogiri::HTML(html)
   
  # Extraction du nom de la mairie avec xpath
  mairie_ville = doc.xpath('//*[@id="mairie"]').text

  # Extraction de l'e-mail de la mairie avec xpath
  mairie_email = doc.xpath('//*[@id="mairie_content"]/div[2]/p[8]/a').text

  # Création du hash avec les données récupérées
  mairie_hash = {
    ville: mairie_ville,
    email: mairie_email
  }

  # Affichage des données récupérées
  puts "Ville: #{mairie_hash[:ville]}"
  puts "E-mail: #{mairie_hash[:email]}"

  return mairie_hash
end

# Appel de la fonction
scrap_mairie_ville

