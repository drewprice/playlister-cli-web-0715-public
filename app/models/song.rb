class Song
  extend Memorable::ClassMethods
  extend Findable
  include Memorable::InstanceMethods

  attr_accessor :name, :artist
  attr_reader :genre

  def add_artist(artist)
    self.artist = artist unless artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def to_s
    "#{artist.name} - #{name} [#{genre.name}]"
  end
end
