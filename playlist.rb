class Playlist
    attr_accessor :name, :songs
  
    def initialize(name)
      @name = name
      @songs = []
    end
  
    def add_song(song)
      @songs << song
    end
  
    def remove_song(song)
      @songs.delete(song)
    end
  end