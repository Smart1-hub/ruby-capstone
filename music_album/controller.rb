require 'json'

module MusicAlbumController
  def save_music_album(album)
    File.new('./music_album/music_albums.json') unless File.exist?('./music_album/music_albums.json')

    if File.empty?('./music_album/music_albums.json')
      music_albums = []
    else
      data = File.read('./music_album/music_albums.json').split
      music_albums = JSON.parse(data.join)
    end

    music_albums.push({ 'id' => album.id, 'on_spotify' => album.on_spotify, 'publish_date' => album.publish_date,
                        'author' => album.author, 'music_label' => album.label,
                        'archived' => album.archived })
    File.write('./music_albums/music_albums.json', music_albums.to_json)
  end

  def list_music_albums
    puts '-' * 40
    File.new('./music_album/music_albums.json', 'w+') unless File.exist?('./music_album/music_albums.json')
  end

  if File.empty?('./music_album/music_albums.json')
    puts 'The album list is empty'
  else
    puts ' Music albums list: '
    data = File.read('./music_album/music_albums.json').split
    music_albums = JSON.parse(data.join)
    music_albums.each_with_index do |music_album, index|
      puts "#{index + 1} -[Music album] ID: #{music_album['id']} | On spotify: #{music_album['on_spotify']} | " \
             "Publish date: #{music_album['publish_date']} | Archived: #{music_album['archived']}"
    end
  end
end
