require_relative "playlist"

class Menu 
    def initialize
        @playlists = []
    end

    def run
        loop do 
            puts "\nMain Menu:"
            puts "1. Create Playlist"
            puts "2. Add songs to playlist"
            puts "3. Remove songs from playlist"
            puts "4. Exit"
            print "Enter your choice: "
            option = gets.chomp.to_i
            
            case option 
            when 1 
              create_playlist
            when 2 
                add_song_to_playlist
            when 3
                remove_song_from_playlist
            when 4
                puts "Have a nice day!"
                break
            else
                puts "That's... uh... not an option"
            end
        end
    end
end

def create_playlist
    print "Enter playlist name: "
    playlist_name = gets.chomp
    playlist= Playlist.new(playlist_name)
    @playlists << Playlist.new(playlist_name)
    puts "Playlist '#{playlist_name}' was created!"
end

    def display_playlist_menu(playlist)
      puts "\n#{playlist.name} Menu:"
      puts "1. Add Song"
      puts "2. Remove Song"
      puts "3. Back to Main Menu"
      print "Enter your choice: "
    end




# def add_songs
    
#     if @playlists.empty?
#     puts "No playlist is available, please create a playlist first"
#     return
#     end

#     puts "Select Playlist"
#     @playlist.each_with_index {|playlist, index| puts "#{index + 1}. #{playlist_name}"}
#     print "Enter playlist number: "
#     playlist_index = gets.chomp.to_i - 1

#     print "Enter song title here: "
#     song = gets.chomp
#     print "Enter album title here: "
#     album = gets.chomp
#     print "Enter artist here: "
#     artist = gets.chomp

#     song = Song.new(song,album,artist)
#     @playlist[playlist_index].add_songs(song)

# end