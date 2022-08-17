require 'json'
require_relative '../classes/author'

def load_games_and_authors(game_list, author_list)
  if File.exist?('./data/games.json')
    file = File.open('.data/games.json')

    if file.size.zero?
      game_list << []
      author_list << []
    else
      games = JSON.parse(File.read('./data/games.json'))

      games.each do |game|
        author = Author.new(game['first_name'], game['last_name'])
        game = Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'])

        game_list << game
        author_list << author
        author.add_item(game)
      end
    end
    file.close
  else
    game_list << []
    author_list << []
  end
end

def save_game(first_name, last_name, publish_date, multiplayer, last_played_at)
  obj = {
    first_name: first_name,
    last_name: last_name,
    publish_date: publish_date,
    multiplayer: multiplayer,
    last_played_at: last_played_at
  }

  return unless File.exist?('./data/games.json')

  if file.size.zero?
    game = [obj]
  else
    game = JSON.parse(File.read('./data/games.json'))
    game << obj
  end

  file.close
  myfile = File.open('./data/games.json', 'w')
  myfile.write(JSON.pretty_generate(game))
  myfile.close
end
