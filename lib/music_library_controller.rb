class MusicLibraryController
  require "pry"


    def initialize(path = "./db/mp3s")
      importer = MusicImporter.new(path)
      importer.import
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
      puts "What would you like to do?"
      user_input = gets.strip until user_input == "exit"
      case user_input
      when "list songs"
        list_songs
      end
    end

    def list_songs
      songs = Song.all.sort_by{|song| song.name}
      songs.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end

      def list_artists
        artists = Artist.all.sort_by{|artist| artist.name}
        artists.each.with_index(1) do |artist, index|
          puts "#{index}. #{artist.name}"
        end
      end

      def list_genres
        genres = Genre.all.sort_by{|genre| genre.name}
        genres.each.with_index(1) do |genre, index|
          puts "#{index}. #{genre.name}"
        end
      end

      def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip
        artist =  Artist.find_by_name(input)
          if artist
            sorted = artist.songs.sort_by{|song| song.name}
            sorted.each.with_index(1) do |song, index|
              puts "#{ index }. #{ song.name} - #{song.genre.name}"
            end
          end
      end

      def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.strip
        genre = Genre.find_by_name(input)
          if genre
            sorted_genre = genre.songs.sort_by{|song| song.name}
            sorted_genre.each.with_index(1) do |song, index|
              puts "#{index}. #{song.artist.name} - #{song.name}"
            end
          end
      end

      def play_song
        puts "Which song number would you like to play?"
        input = gets.strip
        if input <= Song.all.length
          puts "Playing"
        end
      end



  end
