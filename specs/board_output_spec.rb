require "minitest/autorun"
require_relative "../lib/board"
require_relative "../lib/player"
require_relative "../lib/board_output"

class MyIO
	
  attr_reader :output
  def initialize
    @output = []
  end
	
  def print_string(s=nil)
    @output << s
  end
  
end

class BoardOutputTests < MiniTest::Unit::TestCase

  def test_prints_empty_board_with_3_rows
    io = MyIO.new
    board = Board.empty
	  BoardOutput.new(io).print(board)
    assert_equal io.output, [
      "       +---+---+---+", "       | 1 | 2 | 3 |",
      "       +---+---+---+", "       | 4 | 5 | 6 |", 
      "       +---+---+---+", "       | 7 | 8 | 9 |", 
      "       +---+---+---+"]
  end
  
  def test_prints_empty_board_with_2_rows
    io = MyIO.new
    board = Board.new 2
	  BoardOutput.new(io).print(board)
    assert_equal io.output, [
      "       +---+---+", "       | 1 | 2 |", 
      "       +---+---+", "       | 3 | 4 |", 
      "       +---+---+"]
  end

end
  
class MultiDigitBoardOutputTests < MiniTest::Unit::TestCase
  
  def test_separator_with_4_rows_each_cell_is_wider_because_the_numbers_become_two_digits
    io = MyIO.new
    board = Board.new 4
	  BoardOutput.new(io).print(board)
    assert_equal io.output[0], BoardOutput::LEFT_MARGIN + "+----+----+----+----+"
  end
  
  def test_padding_the_numbers_for_4_rows
    io = MyIO.new
    board = Board.new 4
	  BoardOutput.new(io).print(board)
    assert_equal io.output[1], BoardOutput::LEFT_MARGIN + "|  1 |  2 |  3 |  4 |"
  end
  
  def test_pad_the_players_character
    io = MyIO.new
    player = ComputerPlayer.new("C")
    board = Board.new 4
    board.make_move_to(0, player)
	  BoardOutput.new(io).print(board)
    assert_equal io.output[1], BoardOutput::LEFT_MARGIN + "|  C |  2 |  3 |  4 |"
  end
  
  def test_colored_padded_players_character
    io = MyIO.new
    player = ComputerPlayer.new("C")
    player.set_color(Colorize::RED)
    board = Board.new 4
    board.make_move_to(0, player)
	  BoardOutput.new(io).print(board)
    assert_equal io.output[1], BoardOutput::LEFT_MARGIN + "|  #{player.to_s} |  2 |  3 |  4 |"
  end
  
end
