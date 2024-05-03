require 'rspec'
require_relative '../lib/scrap_ministre' # Assure-toi d'avoir le bon chemin vers ton f# 

RSpec.describe "scrap_ministre_name" do
  it "returns an array of hashes containing minister names and functions" do
    ministre_array = scrap_ministre_name
    expect(ministre_array).to be_an(Array)
    expect(ministre_array).not_to be_empty
    ministre_array.each do |ministre|
      expect(ministre).to be_a(Hash)
      expect(ministre[:name]).to be_a(String)
      expect(ministre[:fonc]).to be_a(String)
    end
  end
end


