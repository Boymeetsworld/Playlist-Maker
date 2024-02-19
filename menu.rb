require_relative "playlist"

class Menu 
    def initialize
        @playlists = []
    end

    def run
        loop do 
            puts "1. Browse/View Playlists"
            puts "2. Create/Edit Playlists"
            puts "3. Add/Remove Songs from Playlists"
            puts "4. Exit"
            print "Enter your choice: "
            option = gets.chomp.to_i
            
            case option 
            when 1 
                browser_playlist
            when 2 
                create_playlist
            when 3
                add_songs
            when 4
                puts "Have a nice day!"
                break
            else
                puts "That's... uh... not an option"
            end
        end
    end
end