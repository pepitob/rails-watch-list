# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "rest-client"
require "open-uri"

API_KEY = "4ea7489ff6d135a86c581b28eedccc24"

response = RestClient.get "https://api.themoviedb.org/3/movie/top_rated?api_key=#{API_KEY}"
top_articles = JSON.parse(response)["results"]

top_articles.first(19).each do |movie|
  article_url = "https://api.themoviedb.org/3/movie/#{movie['id']}?api_key=#{API_KEY}"
  response = RestClient.get article_url
  a = JSON.parse(response)
  Movie.create(title: a["title"], overview: a["overview"], poster_url: "https://image.tmdb.org/t/p/original#{a["poster_path"]}", rating: a["vote_average"])
end
