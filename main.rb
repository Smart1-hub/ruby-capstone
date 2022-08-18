require_relative 'game'
require_relative 'classes/book'
require_relative 'classes/book_app'
require_relative 'music_album/music_album'
require_relative 'music_album/controller'
require_relative 'author'
require_relative 'genre/genre'
require_relative 'genre/controller'

class Main
  include MusicAlbumsController
  include GenresController

  def initialize
    @genres = load_genres
  end

  def user_input(message)
    print message
    gets.chomp
  end

  def start
    puts '-' * 50
    puts '⭐  Welcome to your catalog of things! ⭐'
    loop do
      puts '-' * 50
      puts '
          1- List all books
          2- List all music albums
          3- List of games
          4- List all genres
          5- List all labels
          6- List all authors
          7- Add a book
          8- Add a music album
          9- Add a game
          10- Quit'

      input = user_input('Choose an option: ').to_i

      break if input == 10

      options(input)
    end
    store_books(@books)
    store_labels(@labels)
    store_genres(@genres)
  end

  def options(input)
    case input
    when 1
      list_books
    when 2
      list_music_albums
    when 3
      list_games
    when 4
      list_genres
    when 5
      list_labels
    when 6
      list_authors
    when 7
      add_book
    when 8
      add_music_album
    when 9
      add_game
    else
      puts 'Please choose a valid number!'
    end
  end
end