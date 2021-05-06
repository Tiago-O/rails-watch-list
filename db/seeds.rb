# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'cleaning up databases'
Movie.destroy_all
List.destroy_all
Bookmark.destroy_all
Review.destroy_all
puts 'databases are clean'

puts 'creating movies'

# API
base_url = 'http://tmdb.lewagon.com/movie/top_rated'
10.times do |n|
  puts "importing movies from page #{n + 1}"
  url = "#{base_url}?page=#{n + 1}"
  parsed_url = JSON.parse(open(url).read)
  results = parsed_url['results']

  results.each do |movie|
    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      poster_url: "https://image.tmdb.org/t/p/w500/#{movie['backdrop_path']}",
      rating: movie['vote_average']
    )
  end
end

puts "created #{Movie.count} movies"
