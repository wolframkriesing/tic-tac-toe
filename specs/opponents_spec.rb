require_relative "../lib/game.rb"
require_relative "../lib/player.rb"
require "minitest/autorun"

PLAYER_1 = "A"
PLAYER_2 = "B"

def default_game_players
  opponents = Opponents.new(PLAYER_1, PLAYER_2)
  opponents.players
end

class OpponentsCharacters < MiniTest::Unit::TestCase

  def test_passes_the_players_character_to_first_player
	  player1 = default_game_players.first
    assert_equal player1.to_s, PLAYER_1
  end

  def test_passes_the_players_character_to_second_player
	  player = default_game_players[1]
    assert_equal player.to_s, PLAYER_2
  end
	
end

class GameTypeDefault < MiniTest::Unit::TestCase

  def test_first_player_is_human
    player = default_game_players.first
    assert_equal player.instance_of?(HumanPlayer), true
  end

  def test_second_player_is_computer
    player = default_game_players[1]
    assert_equal player.instance_of?(ComputerPlayer), true
  end
	
end

class Opponents

  def initialize(player1_char, player2_char)
    @player1_char = player1_char
    @player2_char = player2_char
  end
	
  def players
	  [HumanPlayer.new(@player1_char), ComputerPlayer.new(@player2_char)]
  end
  
end