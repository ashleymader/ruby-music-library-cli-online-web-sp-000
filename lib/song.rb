

class Song 
  attr_accessor :name, :artist, :genre, :musicimporter, :musiclibrarycontroller
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name 
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
  end
  
  def self.all 
    @@all
  end
  
  def save 
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    self.new(name).tap do|song|
      song.save
    end
  end
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre 
    genre.add_song(self)
  end
end 
