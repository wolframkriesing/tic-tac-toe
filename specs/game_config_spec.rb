require_relative "../lib/game_config"
require_relative "../lib/player"
require "minitest/autorun"

PLAYER_1 = "A"
PLAYER_2 = "B"

def default_game_players
  game_config = GameConfig.new
  [game_config.player1(PLAYER_1), game_config.player2(PLAYER_2)]
end

def players_for_game_type(game_type)
  game_config = GameConfig.new(game_type)
  [game_config.player1(PLAYER_1), game_config.player2(PLAYER_2)]
end

class GameConfigCharacters < MiniTest::Unit::TestCase

  def test_passes_the_players_character_to_first_player
	  player1 = default_game_players[0]
    assert_equal player1.name, PLAYER_1
  end

  def test_passes_the_players_character_to_second_player
	  player = default_game_players[1]
    assert_equal player.name, PLAYER_2
  end
	
end

class GameTypeDefault < MiniTest::Unit::TestCase

  def test_first_player_is_human
    player = default_game_players[0]
    assert_equal player.is_a?(HumanPlayer), true
  end

  def test_second_player_is_computer
    player = default_game_players[1]
    assert_equal player.is_a?(ComputerPlayer), true
  end
	
end

class HumanVsComputer < MiniTest::Unit::TestCase

  def test_first_player_is_human
    player = players_for_game_type(GameConfig::HUMAN_VS_COMPUTER)[0]
    assert_equal player.is_a?(HumanPlayer), true
  end
	
  def test_second_player_is_computer
    player = players_for_game_type(GameConfig::HUMAN_VS_COMPUTER)[1]
    assert_equal player.is_a?(ComputerPlayer), true
  end
	
end

class ComputerVsHuman < MiniTest::Unit::TestCase

  def test_first_player_is_human
    player = players_for_game_type(GameConfig::COMPUTER_VS_HUMAN)[0]
    assert_equal player.is_a?(ComputerPlayer), true
  end
	
  def test_second_player_is_computer
    player = players_for_game_type(GameConfig::COMPUTER_VS_HUMAN)[1]
    assert_equal player.is_a?(HumanPlayer), true
  end
	
end

class ComputerVsComputer < MiniTest::Unit::TestCase

  def test_first_player_is_human
    player = players_for_game_type(GameConfig::COMPUTER_VS_COMPUTER)[0]
    assert_equal player.is_a?(ComputerPlayer), true
  end
	
  def test_second_player_is_computer
    player = players_for_game_type(GameConfig::COMPUTER_VS_COMPUTER)[1]
    assert_equal player.is_a?(ComputerPlayer), true
  end
	
end

class HumanVsHuman < MiniTest::Unit::TestCase

  def test_first_player_is_human
    player = players_for_game_type(GameConfig::HUMAN_VS_HUMAN)[0]
    assert_equal player.is_a?(HumanPlayer), true
  end
	
  def test_second_player_is_computer
    player = players_for_game_type(GameConfig::HUMAN_VS_HUMAN)[1]
    assert_equal player.is_a?(HumanPlayer), true
  end
	
end
