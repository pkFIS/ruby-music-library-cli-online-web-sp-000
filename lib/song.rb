class Song

  attr_accessor :name, :artist, :Genre

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all

  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
  end


end
