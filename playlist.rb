class Playlist 
    attr_accessor :artist, :album, :song

def initialize(artist, album, song)
    @artist = artist
    @album = album
    @song = song
end

def to_s 
 "#{@song} by #{@artist} off of #{@album}"
end
end