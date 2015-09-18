require_relative "_input_double"
require_relative "../lib/game"
require_relative "../lib/board"
require_relative "../lib/player"
require "minitest/autorun"

class GameScreensDouble
  
  attr_reader :calls
  
  def initialize()
    @calls = []
  end
  
  def game_start(board); @calls << 'game_start'; end
  def next_move_screen(board); @calls << 'next_move_screen'; end
  def game_over(board); @calls << 'game_over'; end
  def invalid_cell(cell_index); @calls << 'invalid_cell'; end
  
end

class GameTests < MiniTest::Unit::TestCase

  def test_renders_start_screen
    player1 = HumanPlayer.new("X", MyInput.new("12"))
    player2 = HumanPlayer.new("O", MyInput.new("34"))
    game_screens = GameScreensDouble.new
    
    Game.new(player1, player2, game_screens).start_game(Board.new(2))
    
    assert_equal game_screens.calls.include?('game_start'), true
  end
  
  def test_renders_invalid_cell
    player1 = HumanPlayer.new("X", MyInput.new(["a", "1", "2"]))
    player2 = HumanPlayer.new("O", MyInput.new(["3", "4"]))
    game_screens = GameScreensDouble.new
    
    Game.new(player1, player2, game_screens).start_game(Board.new(2))
    
    assert_equal game_screens.calls.include?('invalid_cell'), true
  end
	
end