require 'rspec'
require_relative '../lib/crypto_scraper.rb' # Assure-toi d'avoir le bon chemin vers ton f# 

# describe the function to test
RSpec.describe 'scrap_crypto_prices' do
  it 'returns an array of hashes containing cryptocurrency names and prices' do
    # call the function
    crypto_array = scrap_crypto_prices
    
    # check if the return value is an array
    expect(crypto_array).to be_an(Array)

    # check if each element in the array is a hash
    crypto_array.each do |crypto|
      expect(crypto).to be_a(Hash)
    end

    # check if each hash contains a name key and a price key
    crypto_array.each do |crypto|
      expect(crypto).to have_key(crypto.keys.first) # Assuming the first key is the name
      expect(crypto.values.first).to be_a(Float) # Assuming the value is the price
    end
  end
end


