class MusicImporter

  attr_accessor :filepath

  def initialize(filepath)
    @filepath = filepath
  end

  def files
    files = Dir.entries(@filepath)
  end

  def self.import
     files.each{|file| Song.create_from_filename(file)}
  end

end
