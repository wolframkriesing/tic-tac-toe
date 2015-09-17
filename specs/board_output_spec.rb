require "minitest/autorun"
require_relative "../lib/board"
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
  
  def test_board_with_4_rows_each_cell_is_wider_because_the_numbers_become_two_digits
    io = MyIO.new
    board = Board.new 4
	  BoardOutput.new(io).print(board)
    assert_equal io.output[0], BoardOutput::LEFT_MARGIN + "+----+----+----+----+"
  end
  
end
