class MusicLibraryController

  def initialize(filepath = "./db/mp3s/")
    MusicImporter.new
  end

  def call


  end

end
