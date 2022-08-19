require_relative '../classes/genre'
require_relative '../controllers/genre_controller'
require_relative '../classes/album'
require_relative '../controllers/album_controller'

describe Genre do
  include GenresController
  it 'item should be added to array' do
    genre = Genre.new('genre')
    music_album = MusicAlbum.new('test', '20/10/2010', 'test')
    genre.add_item(music_album)
    expect(genre.items).to contain_exactly(music_album)
  end

  it 'should store genres' do
    genres = [Genre.new('test1'), Genre.new('test2')]
    store_genres(genres)
    expect(File.exist?('./genre/genres.json') && File.read('./genre/genres.json') != '').to eq true
    File.write('./genre/genres.json', '')
  end
end
