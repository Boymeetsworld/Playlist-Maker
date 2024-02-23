require 'minitest/autorun'
require 'stringio'

class MenuTest < Minitest::Test
  def setup
    @app = Menu.new
  end

  def test_run_with_invalid_choice
    input = StringIO.new("6\n")
    $stdin = input

    expected_output = <<~OUTPUT
      Main Menu:
      1. Browse Playlists
      2. Create Playlist
      3. Edit Playlists
      4. Display Playlist Songs
      5. Exit
      Enter your choice: 
      Thats... uh... not an option
    OUTPUT

    assert_output(expected_output) { @app.run }
  end

  def test_run_with_browse_playlists_choice
    input = StringIO.new("1\n5\n")
    $stdin = input

    expected_output = <<~OUTPUT
      Main Menu:
      1. Browse Playlists
      2. Create Playlist
      3. Edit Playlists
      4. Display Playlist Songs
      5. Exit
      Enter your choice: 
      Seems like theres no playlist here (Anyone home?)
      Main Menu:
      1. Browse Playlists
      2. Create Playlist
      3. Edit Playlists
      4. Display Playlist Songs
      5. Exit
      Enter your choice: 
      "Peace out!"
    OUTPUT

    assert_output(expected_output) { @app.run }
  end
end