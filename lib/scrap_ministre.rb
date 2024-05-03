require 'nokogiri'
require 'open-uri'

def scrap_ministre_name
  # Définition de l'URL à scraper
  url = "https://www.sec.gouv.sn/le-gouvernement"

  # Récupération du HTML de la page
  html = URI.open(url)

  # Parsing du HTML avec Nokogiri
  doc = Nokogiri::HTML(html)
   
  # Extraction de tous les noms de ministre avec xpath
  ministre_name = doc.xpath('//h4[contains(@class, "minister")]').map(&:text)

  # Extraction de tous les fonctions de la ministériel avec xpath
  ministre_fonc = doc.xpath('//p[contains(@class, "minister")]').map(&:text)

  # Création du tableau de hashes avec les données récupérées
  ministre_array = []
  ministre_name.each_with_index do |name, index|
    ministre_array << { name: name, fonc: ministre_fonc[index] }
  end

  # Affichage des données récupérées
  ministre_array.each do |ministre|
    puts "Nom: #{ministre[:name]}"
    puts "Fonction: #{ministre[:fonc]}"
    puts ""
  end

  return ministre_array
end

# Appel de la fonction
scrap_ministre_name


