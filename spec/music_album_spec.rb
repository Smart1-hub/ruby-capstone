require_relative '../music_album/music_album'
require_relative '../music_album/controller'

describe MusicAlbum do
  include MusicAlbumController
  it 'Should a music album instance' do
    music_album = MusicAlbum.new(true, '04-01-2020')
    expect(music_album).to be_instance_of MusicAlbum
  end

  it 'Archived should be true' do
    music_album = MusicAlbum.new(true, '04-01-2020')
    music_album.move_to_archive
    music_album.archived.should eq true
  end
end