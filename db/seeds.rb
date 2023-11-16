puts "Destoying movies"
Movie.destroy_all
List.destroy_all
Bookmark.destroy_all

puts "Seeding"

url = "https://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)
movies['results'].each do |movie|
  movie = Movie.new(title: movie['original_title'], overview: movie['overview'], poster_url: movie['poster_path'], rating: movie['vote_average'])
  if movie.save
    p movie
  else
    puts 'Failed to save movie'
  end
end

List.create!(name: 'My seeded list')
Bookmark.create!(comment: 'My seeded comment 1', movie_id: 1, list_id: "1")
Bookmark.create!(comment: 'My seeded comment 2', movie_id: 2, list_id: 1)

puts 'Done'
