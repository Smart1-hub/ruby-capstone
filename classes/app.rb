# rubocop:disable Metrics/MethodLength

require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'data/data_book'
require_relative '../data/author_data'
require_relative '../data/game_data'
require 'date'

class App
  def initialize
    @all_books = []
    @all_labels = []
    @author_data = AuthorData.new
    @game_data = GameData.new
    @authors = @author_data.load_authors
    @games = @game_data.load_games
  end

  def run
    load_preserve_data
    puts 'Welcome To The Catalog of My Things!'
    puts
    puts
    until list_options
      input = gets.chomp
      if input == '10'
        puts 'Have good day :)'
        break
      end
      option(input)
    end
  end

  def list_books
    puts
    puts 'No books to show! Please add a book.' if @all_books.empty?

    @all_books.each do |book|
      puts '----------------'
      puts "ID: #{book.id}"
      puts "Publisher: #{book.publisher}"
      puts "Cover State: #{book.cover_state}"
      puts "Label: \'#{book.label.title}\', \'#{book.label.color}\'"
      puts "Publish Date: #{book.publish_date}"
      puts '----------------'
      puts
    end
    puts
    puts
    sleep 0.75
  end

  def list_labels
    puts
    puts 'No labels to show! Please add a label.' if @all_labels.empty?

    @all_labels.each { |label| puts "Id: \'#{label.id}\', Title: \'#{label.title}\', Color: \'#{label.color}\'" }
    puts
    puts
    sleep 0.75
  end

  def add_author(author)
    @authors << author
  end

  def add_game(game)
    @games << game
  end

  def list_authors
    if @authors.empty?
      puts 'Authors Catalog is empty! Choose (6) to add an author: '
    else
      @authors.each { |author| puts "First Name: #{author.first_name}, Last Name:  #{author.last_name}" }
    end
  end

  def list_games
    if @games.empty?
      puts 'Games Catalog is empty! Choose (5) to add a game.'
    else
      @games.each do |game|
        puts "Multiplayer:  #{game.multiplayer}, last played at:  #{game.last_played_at},
        published date:  #{game.publish_date}\n"
      end
    end
  end

  def create_book
    puts
    print 'Publisher: '
    book_publisher = gets.chomp

    print 'Cover State: '
    book_cover_state = gets.chomp

    print 'Label Title: '
    book_label_title = gets.chomp

    print 'Label Color: '
    book_label_color = gets.chomp

    print 'Publish Date (DD-MM-YYYY): '
    book_publish_date = gets.chomp

    puts

    label = Label.new book_label_title, book_label_color

    mybook = Book.new book_publisher, book_cover_state, book_publish_date

    @all_books << mybook
    @all_labels << label

    label.add_item(mybook)

    save_book(book_publisher, book_cover_state, book_label_title, book_label_color, book_publish_date)

    puts 'Book created successfully.✅'
    puts
    puts
    sleep 0.75
  end

  def create_author
    pirnt 'Enter First Name: '
    first_name = gets.chomp
    print 'Enter Last Name: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    create_author(author)
  end

  def create_game
    print 'Is game a Multiplayer Yes(y) pr No(n) -> (Y/N): '
    multiplayer = gets.chomp.downcase == 'y' ? 'Yes' : 'No'
    print 'Enter published date, format -> DD-MM-YYYY: '
    publish_date = gets.chomp
    print 'Enter date last played, format -> DD-MM-YYYY: '
    last_played_at = gets.chomp
    game = Game.new(publish_date, multiplayer, last_played_at)
    create_game(game)
  end

  def save_files
    @author_data.save_authors(@authors)
    @game_data.save_games(@games)
  end

  def load_preserve_data
    load_books_and_labels @all_books, @all_labels
  end
end

# rubocop:enable Metrics/MethodLength
