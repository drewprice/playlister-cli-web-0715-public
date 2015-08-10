class Genre
  extend Memorable::ClassMethods
  extend Findable
  include Memorable::InstanceMethods

  attr_accessor :name, :songs, :artists

  def initialize
    @artists = []
    @songs = []
    super
  end

  def add_song(song)
    songs << song
  end

  def add_artist(artist)
    artists << artist unless artists.include? artist
  end
end
