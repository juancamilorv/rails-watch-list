# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'json'

response = URI.open('http://tmdb.lewagon.com/movie/top_rated').read
json = JSON.parse(response)

movies = json['results'][0..9]

movies.each do |movie|
  base_url = 'https://image.tmdb.org/t/p'
  size = '/w500'
  file_path = movie['poster_path']
  poster = base_url + size + file_path

  Movie.create!(title: movie['original_title'],
                overview: movie['overview'],
                poster_url: poster,
                rating: movie['vote_average'])

  puts "Movie '#{movie['original_title']}' created!"
end
