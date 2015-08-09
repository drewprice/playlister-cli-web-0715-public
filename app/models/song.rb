class Song
  extend Memorable::ClassMethods
  extend Findable
  include Memorable::InstanceMethods
  include Paramable

  attr_accessor :name
  attr_reader :artist, :genre

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include? self
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def to_s
    "#{artist.name} - #{name} [#{genre.name}]"
  end
end
