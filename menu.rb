require_relative "playlist"

class Menu
    def initialize
      @playlists = []
    end
  
    def run
      loop do
      puts "Main Menu:"
      puts "1. Browse Playlists"
      puts "2. Create Playlist"
      puts "3. Edit Playlists"
      puts "4. Display Playlist Songs"
      puts "5. Exit"
      print "Enter your choice: "
        choice = gets.chomp.to_i
        case choice
        when 1
          browse_playlists
        when 2
          create_playlist
        when 3
          edit_playlists
        when 4
          display_playlist_songs
        when 5
          pp "Peace out!"
          break
        else
          puts "Thats... uh... not an option"
        end
      end
    end
  
    private
    #this path will display all created playlists
    def browse_playlists
      if @playlists.empty?
        puts "Seems like theres no playlist here (Anyone home?)"
        return
      end
  
      puts "Available Playlists:"
      @playlists.each_with_index do |playlist, index|
        puts "#{index + 1}. #{playlist.name}"
      end
      print "Enter the playlist number to manage: "
      playlist_index = gets.chomp.to_i - 1
      if playlist_index >= 0 && playlist_index < @playlists.length
        manage_playlist(@playlists[playlist_index])
      else
        puts "Uhh that's not a playlist number..."
      end
    end
    #This path will guide users into creating a new playlist
    def create_playlist
      print "Enter playlist name: "
      playlist_name = gets.chomp
      @playlists << Playlist.new(playlist_name)
      puts "Playlist '#{playlist_name}' was created successfully!"
    end
  

    def edit_playlists
      if @playlists.empty?
        puts "No playlists available."
        return
      end
  
      puts "Available Playlists:"
      @playlists.each_with_index do |playlist, index|
        puts "#{index + 1}. #{playlist.name}"
      end
      print "Enter the playlist number to edit: "
   playlist_index = gets.chomp.to_i - 1
      if playlist_index >= 0 && playlist_index < @playlists.length
        edit_playlist(@playlists[playlist_index])
      else
        puts "Invalid playlist number."
      end
    end
  #This path will allow users to add or remove a song from a playlist
    def manage_playlist(playlist)
      loop do
        display_playlist_menu(playlist)
        choice = gets.chomp.to_i
        case choice
        when 1
          add_song_to_playlist(playlist)
        when 2
          remove_song_from_playlist(playlist)
        when 3
          break
        else
          puts "No can do..."
        end
      end
    end
  #This path will allow users to change a playlist's name
    def edit_playlist(playlist)
      loop do
        display_edit_menu(playlist)
        choice = gets.chomp.to_i
        case choice
        when 1
          print "Enter new playlist name: "
          new_name = gets.chomp
          playlist.name = new_name
          puts "Playlist name updated successfully!"
        when 2
          break
        else
          puts "Invalid choice. Please try again."
        end
      end
    end
  
    def display_playlist_menu(playlist)
      puts "{playlist.name} Menu:"
      puts "1. Add Song"
      puts "2. Remove Song"
      puts "3. Back to Main Menu"
      print "Enter your choice: "
    end
  
    def add_song_to_playlist(playlist)
      print "Enter song name: "
      song_name = gets.chomp
      playlist.add_song(song_name)
      puts "Song '#{song_name}' added to playlist '#{playlist.name}'!"
    end
  
    def remove_song_from_playlist(playlist)
      if playlist.songs.empty?
        puts "No songs in #{playlist.name}."
        return
      end
  
      puts "Songs in #{playlist.name}:"
      playlist.songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song}"
      end
      print "Enter the song number to remove: "
      song_index = gets.chomp.to_i - 1
      if song_index >= 0 && song_index < playlist.songs.length
        removed_song = playlist.songs.delete_at(song_index)
        puts "Song '#{removed_song}' removed from playlist '#{playlist.name}'!"
      else
        puts "Invalid song number."
      end
    end
  
    def display_edit_menu(playlist)
      puts "\nEdit #{playlist.name}:"
      puts "1. Change Playlist Name"
      puts "2. Back to Main Menu"
      print "Enter your choice: "
    end
  end