# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"

url = "https://data.opendatasoft.com/api/records/1.0/search/?dataset=economicref-france-sirene-v3%40public&q=11.05Z&refine.etatadministratifetablissement=Actif"
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)

repos["records"].each do |e|
  Brewery.create(
      name: e["denominationunitelegale"],
      address: e["adresseetablissement"],
      poster_url: "https://image.tmdb.org/t/p/w500#{e["backdrop_path"]}",
      rating: e["vote_average"],
  )