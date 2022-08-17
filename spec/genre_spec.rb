require_relative '../genre/genre'
require_relative '../genre/controller'
require_relative '../music_album/music_album'

describe Genre do
  include GenresController
  it 'item should be added to array' do
    genre = Genre.new('genre')
    music_album = MusicAlbum.new('test', '20/10/2010', 'test')
    genre.add_item(music_album)
    expect(genre.items).to contain_exactly(music_album)
  end
end
