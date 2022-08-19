require 'json'

module GamesController
  def save_games(games)
    file = './data/games.json'
    File.new('./data/games.json', 'w+') unless File.exist?(file)

    data = []

    games.each do |game|
      data << Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'])
    end
    File.write(file, JSON.generate(data))
  end

  def add_game()
    author_first_name = user_input("Author\'s First Name:  ")
    author_last_name = user_input("Author\'s Last Name:  ")
    publish_date = user_input("Game\'s publish date: ")
    multiplayer = user_input('Multiplayer -> Yes(y) or No(n): ')
    genre = Genre.new(user_input("Game\'s genre: "))
    label = Label.new(user_input("Game\'s label: "))
    author = Author.new(author_first_name, author_last_name)
    new_game = Game.new(publish_date, multiplayer, last_played_at)
    new_game.genre = genre
    new_game.label = label
    new_game.author = author
    new_game.move_to_archive
    @games << new_game
    @labels << label
    @genres << genres
    add_author(author)
    puts "The game by #{author_first_name} has been created successfully ✅"
  end

  def list_games
    data = []
    file = './data/games.json'
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |game|
      new_game = Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'])
      new_game.author = Author.new(game['author']['first_name'], game['author']['last_name'])
      data << new_game
    end
  end
end
