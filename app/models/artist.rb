class Artist
  extend Memorable::ClassMethods
  extend Findable
  include Memorable::InstanceMethods
  include Paramable

  attr_accessor :name, :genres
  attr_reader :songs

  def initialize
    @songs = []
    @genres = []
    super
  end

  def add_song(song)
    songs << song unless songs.include? song
    add_genre(song.genre) if song.genre
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  private

  def add_genre(genre)
    genres << genre
    genre.add_artist(self)
  end
end
