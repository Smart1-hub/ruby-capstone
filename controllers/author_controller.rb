require 'json'

module AuthorsController
  def add_author(author)
    File.new('./data/authors.json', 'w+') unless File.exist?('../data/authors.json')

    if File.empty?('./data/authors.json')
      authors = []
    else
      data = File.read('./data/authors.json').split
      authors = JSON.parse(data.join)
    end

    authors.push({ id: author.id, first_name: author.first_name, last_name: author.last_name })

    File.write('./data/authors.json', authors.to_json)
  end

  def list_authors
    puts '-' * 50
    File.new('./data/authors.json', 'w+') unless File.exist?('../data/authors.json')

    if File.empty?('./data/authors.json')
      puts 'The authors list is empty'
    else
      data = File.read('./data/authors.json').split
      authors = JSON.parse(data.join)
      puts '🤵 Authors list:'
      authors.each_with_index do |author, index|
        puts "#{index + 1}-[Author] First Name: #{author['first_name']} | Last Name: #{author['last_name']}"
      end
    end
  end
end
