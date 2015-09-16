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
    assert_equal io.output, ["       +---+---+---+", "       | 0 | 1 | 2 |", "       +---+---+---+", "       | 3 | 4 | 5 |", "       +---+---+---+", "       | 6 | 7 | 8 |", "       +---+---+---+"]
  end
  
  def test_prints_empty_board_with_2_rows
    io = MyIO.new
    board = Board.with_number_of_rows 2
    board.empty_all_cells
	  BoardOutput.new(io).print(board)
    assert_equal io.output, ["       +---+---+", "       | 0 | 1 |", "       +---+---+", "       | 2 | 3 |", "       +---+---+"]
  end
  
end
