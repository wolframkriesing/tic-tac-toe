require "minitest/autorun"
require_relative "boards"
require_relative "../lib/board_output"

class IO
	
  attr_reader :output
  def initialize
    @output = []
  end
	
  def put_string(s=nil)
    @output << s
  end
  
end

class BoardOutputTests < MiniTest::Unit::TestCase

  def test_prints_empty_board
    io = IO.new
    board = Boards.empty_board
	  BoardOutput.new(io).print(board)
    assert_equal io.output, [nil, "       +---+---+---+", "       | 0 | 1 | 2 |", "       +---+---+---+", "       | 3 | 4 | 5 |", "       +---+---+---+", "       | 6 | 7 | 8 |", "       +---+---+---+", nil]
  end
  
end