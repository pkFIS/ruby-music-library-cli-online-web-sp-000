class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."

    input = ""
    while input != 'exit'
      puts "What would you like to do?"
      input = gets.strip
      case input
        when "list songs"
          list_songs
        when "list artists"
          list_artists
        when "list genres"
          list_genres
        when "list artist"
          list_songs_by_artist
        when "list genre"
          list_songs_by_genre
        when "play song"
          play_song
      end
    end
  end

  def list_songs
    Song.all.sort_by{|song| song.name}.each.with_index(1){|song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    Artist.all.sort_by{|artist| artist.name}.each.with_index(1){|artist, index| puts "#{index}. #{artist.name}"}
  end

  def list_genres
    Genre.all.sort_by{|genre| genre.name}.each.with_index(1){|genre, index| puts "#{index}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.strip
    if artist = Artist.find_by_name(artist)
      artist.songs.sort_by{|song| song.name}.each.with_index(1){|song, index| puts "#{index}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.strip
    if genre = Genre.find_by_name(genre)
      genre.songs.sort_by{|song| song.name}.each.with_index(1) {|song, index| puts "#{index}. #{song.artist.name} - #{song.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    num = gets.strip.to_i
    if (1..Song.all.length).include?(num)
      song = Song.all.sort{|a, b| a.name <=> b.name}[num - 1]
    end
    puts "Playing #{song.name} by #{song.artist.name}" if song
  end

end
