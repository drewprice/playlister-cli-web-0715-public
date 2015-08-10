class LibraryParser
  attr_reader :files
  def initialize
    @files = Dir.entries('db/data').drop(2)
  end

  def parse_filename(file_name)
    file_name.split(/ - | \[|\].mp3/)
  end

  def build_song(artist, song, genre)
    Song.create_by_name(song).tap do |s|
      s.artist = Artist.create_by_name(artist)
      s.genre  = Genre.create_by_name(genre)
    end
  end

  def call
    files.map do |file|
      song_info = parse_filename(file)
      build_song(song_info[0], song_info[1], song_info[2])
    end
  end
end
