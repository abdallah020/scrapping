require 'nokogiri'
require 'open-uri'

def scrap_crypto_prices
  # Définition de l'URL à scraper
  url = "https://coinmarketcap.com/all/views/all/"

  # Initialisation d'un tableau pour stocker les données
  crypto_array = []

  # Récupération du HTML de la page
  html = URI.open(url)

  # Parsing du HTML avec Nokogiri
  doc = Nokogiri::HTML(html)

  # Extraction des noms des cryptomonnaies et de leurs prix
   crypto_names = doc.xpath('//td[@class="cmc-table__cell cmc-table__cell--sticky cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__name"]/div/a')
   crypto_prices = doc.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]/div/a')
  # Création du tableau de hashes
   crypto_names.each_with_index do |name, index|
     crypto_hash = {}
     # Vérifie si crypto_prices[index] existe avant d'appeler text
     if crypto_prices[index]
        crypto_hash[name.text] = crypto_prices[index].text.gsub("$", "").to_f
        crypto_array << crypto_hash
     end
   end

  # Affichage des données récupérées
  crypto_array.each do |crypto|
    puts crypto
  end

  return crypto_array
end

# Appel de la fonction
scrap_crypto_prices

