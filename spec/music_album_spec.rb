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

  it 'archived should be false' do
    music_album = MusicAlbum.new(false, '04-01-2010')
    music_album.archived.should eq false
  end

  it 'Store MusicAlbum in json file' do
    music_album = MusicAlbum.new(true, '04-10-2020')
    save_music_album(music_album)
    expect(File.exist?('./music_album/music_albums.json') &&
             File.read('./music_album/music_albums.json') != '').to eq true
    File.write('./music_album/music_albums.json', '')
  end
end
