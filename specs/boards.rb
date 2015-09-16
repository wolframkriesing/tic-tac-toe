require_relative "../lib/board"
require_relative "../lib/cell"
require_relative "../lib/player"

PLAYER1 = Player.new("player 1")
PLAYER2 = Player.new("player 2")

class WinningBoards
  def self.player1
    PLAYER1
  end
	
  def self.player2
    PLAYER2
  end
	
  def self.top_row_won_by_player1
    top_row_won_by(player1)
  end
  
  def self.middle_row_won_by_player1
    middle_row_won_by(player1)
  end
  
  def self.bottom_row_won_by_player1
    bottom_row_won_by(player1)
  end

  def self.occupy_cells_by(player, cell1, cell2, cell3)
    board = Boards.empty_board
    board.make_move(cell1, player)
    board.make_move(cell2, player)
    board.make_move(cell3, player)
    board
  end
 
  def self.top_row_won_by(player)
    occupy_cells_by(player, 0, 1, 2)
  end
  
  def self.middle_row_won_by(player)
    occupy_cells_by(player, 3, 4, 5)
  end
    
  def self.bottom_row_won_by(player)
    occupy_cells_by(player, 6, 7, 8)
  end
  
  def self.left_column_won_by(player)
    occupy_cells_by(player, 0, 3, 6)
  end
  
  def self.middle_column_won_by(player)
    occupy_cells_by(player, 1, 4, 7)
  end
    
  def self.right_column_won_by(player)
    occupy_cells_by(player, 2, 5, 8)
  end
  
  def self.diagonal_from_left_top_won_by(player)
    occupy_cells_by(player, 0, 4, 8)
  end
  
  def self.diagonal_from_right_top_won_by(player)
    occupy_cells_by(player, 2, 4, 6)
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
    Board.new(board)
  end
      
end

class Boards < WinningBoards
    
  def self.diagonal_from_left_top_won_by_player1
    diagonal_from_left_top_won_by(player1)
  end
  
  def self.diagonal_from_right_top_won_by_player2
    diagonal_from_right_top_won_by(player2)
  end
  
  def self.empty_board
    Board.empty
  end
  
  def self.tie_board
    Boards.to_board("HCCCHHCHC")
  end
  
  def self.fill_cell_0_to_win(player)
    board = Board.empty
    board.make_move(1, player)
    board.make_move(2, player)
    board
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