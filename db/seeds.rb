# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"

puts "Cleaning up database..."
Brewery.destroy_all
puts "Database cleaned"

breweries_data = JSON.parse(URI.open("https://data.opendatasoft.com/api/records/1.0/search/?dataset=economicref-france-sirene-v3%40public&q=11.05Z&rows=1000&refine.etatadministratifetablissement=Actif").read)['records']
breweries_data.each do |data|
  Brewery.create(
    name: data['fields']['denominationunitelegale'],
    address: data['fields']['adresseetablissement'],
    city: data['fields']['libellecommuneetablissement'],
    zip: data['fields']['codepostaletablissement']
  )
end
puts "breweries created"



