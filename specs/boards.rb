require_relative "../lib/cell"
require_relative "../lib/player"

$player_1 = Player.new("player 1")
$player_2 = Player.new("player 2")

class Boards
    
  def self.player1
    $player_1
  end
	
  def self.player2
    $player_2
  end
	
  def self.diagonal_from_left_top_won_by_player1
    diagonal_from_left_top_won_by(player1)
  end
  
  def self.diagonal_from_right_top_won_by_player2
    diagonal_from_right_top_won_by(player2)
  end
  
  def self.top_row_won_by_player1
    top_row_won_by(player1)
  end
  
  def self.bottom_row_won_by_player1
    bottom_row_won_by(player1)
  end
  
  def self.empty_board
    [
      Cell.new, Cell.new, Cell.new,
      Cell.new, Cell.new, Cell.new,
      Cell.new, Cell.new, Cell.new
    ]
  end
  
  def self.tie_board
    [
      cell_occupyed_by(player1), cell_occupyed_by(player2), cell_occupyed_by(player2), 
      cell_occupyed_by(player2), cell_occupyed_by(player1), cell_occupyed_by(player1), 
      cell_occupyed_by(player2), cell_occupyed_by(player1), cell_occupyed_by(player2), 
    ]
  end
  
  def self.top_row_won_by(player)
    [
      cell_occupyed_by(player), cell_occupyed_by(player), cell_occupyed_by(player),
      Cell.new, Cell.new, Cell.new,
      Cell.new, Cell.new, Cell.new
    ]
  end
  
  def self.bottom_row_won_by(player)
    [
      Cell.new, Cell.new, Cell.new,
      Cell.new, Cell.new, Cell.new,
      cell_occupyed_by(player), cell_occupyed_by(player), cell_occupyed_by(player),
    ]
  end
  
  def self.diagonal_from_left_top_won_by(player)
    [
      cell_occupyed_by(player), Cell.new, Cell.new,
      Cell.new, cell_occupyed_by(player), Cell.new, 
      Cell.new, Cell.new, cell_occupyed_by(player), 
    ]
  end
  
  def self.diagonal_from_right_top_won_by(player)
    [
      Cell.new, Cell.new, cell_occupyed_by(player),
      Cell.new, cell_occupyed_by(player), Cell.new, 
      cell_occupyed_by(player), Cell.new, Cell.new 
    ]
  end
  
  def self.fill_cell_0_to_win(player)
    [
      Cell.new, cell_occupyed_by(player), cell_occupyed_by(player),
      Cell.new, Cell.new, Cell.new,  
      Cell.new, Cell.new, Cell.new,  
    ]
  end
  
  def self.one_cell_empty(cell_index)
	  board = Boards.tie_board
	  board[cell_index] = Cell.new
	  board
  end
  
  def self.two_cells_empty(cell_index, cell_index1)
	  board = one_cell_empty(cell_index)
	  board[cell_index1] = Cell.new
	  board
  end
  
  COMPUTER_PLAYER = "C"
  HUMAN_PLAYER = "H"
  def self.to_board(s)
    map = {
      COMPUTER_PLAYER => Boards.player1,
      HUMAN_PLAYER => Boards.player2
    }
    board = s.split("").map {|char|
      cell = Cell.new 
      if map[char] != nil
        cell.occupy_by(map[char]) 
      end
      cell
    }
    board
  end
    
  private
  
  def self.cell_occupyed_by(player)
    cell = Cell.new
    cell.occupy_by(player)
    cell
  end

end



require "minitest/autorun"
class BoardsTest < MiniTest::Unit::TestCase
  # just for my ruby (in)sanity
  
  def test_player1_is_always_same
    assert_equal Boards.player1, Boards.player1
  end
  
  def test_player2_is_different
    assert_equal Boards.player2 != Boards.player1, true
  end
  
  def test_diagonal_from_left_top_won_by_player1
    board = Boards.diagonal_from_left_top_won_by_player1
    assert_equal board[0].owned_by_same_player?(board[4]), true
  end
  
end