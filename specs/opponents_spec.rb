require_relative "../lib/opponents.rb"
require_relative "../lib/player.rb"
require "minitest/autorun"

PLAYER_1 = "A"
PLAYER_2 = "B"

def default_game_players
  opponents = Opponents.new
  [opponents.player1(PLAYER_1), opponents.player2(PLAYER_2)]
end

def players_for_game_type(game_type)
  opponents = Opponents.new(game_type)
  [opponents.player1(PLAYER_1), opponents.player2(PLAYER_2)]
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

class HumanVsComputer < MiniTest::Unit::TestCase

  def test_first_player_is_human
    player = players_for_game_type(Opponents::HUMAN_VS_COMPUTER).first
    assert_equal player.instance_of?(HumanPlayer), true
  end
	
  def test_second_player_is_computer
    player = players_for_game_type(Opponents::HUMAN_VS_COMPUTER)[1]
    assert_equal player.instance_of?(ComputerPlayer), true
  end
	
end

class ComputerVsHuman < MiniTest::Unit::TestCase

  def test_first_player_is_human
    player = players_for_game_type(Opponents::COMPUTER_VS_HUMAN).first
    assert_equal player.instance_of?(ComputerPlayer), true
  end
	
  def test_second_player_is_computer
    player = players_for_game_type(Opponents::COMPUTER_VS_HUMAN)[1]
    assert_equal player.instance_of?(HumanPlayer), true
  end
	
end

class ComputerVsComputer < MiniTest::Unit::TestCase

  def test_first_player_is_human
    player = players_for_game_type(Opponents::COMPUTER_VS_COMPUTER).first
    assert_equal player.instance_of?(ComputerPlayer), true
  end
	
  def test_second_player_is_computer
    player = players_for_game_type(Opponents::COMPUTER_VS_COMPUTER)[1]
    assert_equal player.instance_of?(ComputerPlayer), true
  end
	
end

class HumanVsHuman < MiniTest::Unit::TestCase

  def test_first_player_is_human
    player = players_for_game_type(Opponents::HUMAN_VS_HUMAN).first
    assert_equal player.instance_of?(HumanPlayer), true
  end
	
  def test_second_player_is_computer
    player = players_for_game_type(Opponents::HUMAN_VS_HUMAN)[1]
    assert_equal player.instance_of?(HumanPlayer), true
  end
	
end
