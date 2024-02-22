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
    @playlists << Playlist.new(playlist_name)
    puts "Playlist '#{playlist_name}' was created!"
end

def add_song_to_playlist 
  if @playlists.empty?
    puts "No playlist are available, think you could make one for me?"
    return
  end

display_playlists
print "enter playlist number to add song to: "
playlist_index = gets.chomp.to_i - 1
playlist = @playlists[playlist_index]
if playlist.nil?
  puts "invalid playlist number"
  return
  end

  print "Enter song name: "
  song_name = gets.chomp
  playlist.add_song(song_name)
  puts "song: #{song_name} added to playlist: #{playlist_name}!"
end

def remove_song_from_playlist
    if @playlists.empty? 
        puts "No playlist are available, think you could make one for me?"
        return
    end

    display_playlists
    print "enter playlist number to remove song from: "
    song_index = gets.chomp.to_i
    if song_index >= 0 && song_index < playlist.songs.length
        removed_song = playlist.songs.delete_at(song_index)
        puts "Song: #{removed_song} removed from playlist: #{playlist.name}."
    else
    puts "invalid playlist number"
    
  end

  def display_playlists
    puts "Available Playlists:"
    @playlists.each_with_index do |playlist, index|
        puts "#{index + 1}. #{playlist.name}"
    end
end
end
