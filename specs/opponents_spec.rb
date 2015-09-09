require_relative "../lib/game.rb"
require_relative "../lib/player.rb"
require "minitest/autorun"

PLAYER_1 = "A"
PLAYER_2 = "B"

def default_game_players
  opponents = Opponents.new(PLAYER_1, PLAYER_2)
  opponents.players
end

def players_for_game_type(game_type)
  opponents = Opponents.new(PLAYER_1, PLAYER_2, game_type)
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

class Opponents

  HUMAN_VS_COMPUTER = 0
  COMPUTER_VS_HUMAN = 1
  HUMAN_VS_HUMAN = 2
  COMPUTER_VS_COMPUTER = 3
  
  def initialize(player1_char, player2_char, game_type=HUMAN_VS_COMPUTER)
    @player1_char = player1_char
    @player2_char = player2_char
    @game_type = game_type
  end
	
  def players
    if @game_type == COMPUTER_VS_HUMAN
      return [ComputerPlayer.new(@player2_char), HumanPlayer.new(@player1_char)]
    end 
    if @game_type == COMPUTER_VS_COMPUTER
      return [ComputerPlayer.new(@player2_char), ComputerPlayer.new(@player1_char)]
    end 
    if @game_type == HUMAN_VS_HUMAN
      return [HumanPlayer.new(@player2_char), HumanPlayer.new(@player1_char)]
    end 
	  [HumanPlayer.new(@player1_char), ComputerPlayer.new(@player2_char)]
  end
  
end