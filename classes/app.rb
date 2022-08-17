require_relative '../data/author_data'
require_relative '../data/game_data'

class App
  def initialize
    @author_data = AuthorData.new
    @game_data = GameData.new
    @authors = @author_data.load_authors
    @games = @game_data.load_games
  end

  def add_author(author)
    @authors << author
  end

  def add_game(game)
    @games << game
  end

  def list_authors
    if @authors.empty?
      puts 'Authors Catalog is empty! Choose (A) to add an author: '
    else
      @authors.each { |author| puts "First Name: #{author.first_name}, Last Name:  #{author.last_name}" }
    end
  end

  def list_games
    if @games.empty?
      puts 'Games Catalog is empty! Choose (G) to add a game.'
    else
      @games.each do |game|
        puts "Multiplayer:  #{game.multiplayer}, last played at:  #{game.last_played_at},
        published date:  #{game.publish_date}\n"
      end
    end
  end

  def save_files
    @author_data.save_authors(@authors)
    @game_data.save_games(@games)
  end
end
