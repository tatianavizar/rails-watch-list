require "json"
require "open-uri"

Movie.destroy_all

puts "Starting seeding with API..."

url = "https://tmdb.lewagon.com/movie/top_rated"
response = URI.open(url).read # Utilise open-uri pour lire directement le contenu de l'URL
movies = JSON.parse(response)["results"]

movies.each do |movie_data|
  Movie.create(
    title: movie_data["title"],
    overview: movie_data["overview"],
    url: "https://image.tmdb.org/t/p/original#{movie_data['poster_path']}",
    rating: movie_data["vote_average"]
  )
end

puts "Seeding completed!"

puts "hard seeding"

Movie.create(title: "Wonder Woman 1984",
overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s",
url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
rating: 6.9)

Movie.create(title: "The Shawshank Redemption",
overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison",
url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
rating: 8.7)

Movie.create(title: "Titanic",
overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.",
url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
rating: 7.9)

Movie.create(title: "Ocean's Eight",
overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.",
url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg",
rating: 7.0)

puts "seeding finished"
