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
		Cell.new("0"), Cell.new("1"), Cell.new("2"),
		Cell.new("3"), Cell.new("4"), Cell.new("5"), 
		Cell.new("6"), Cell.new("7"), Cell.new("8"), 
	]
  end
  
  def self.tie_board
    [
      occupied_cell_by("0", player1), occupied_cell_by("1", player2), occupied_cell_by("2", player2), 
      occupied_cell_by("3", player2), occupied_cell_by("4", player1), occupied_cell_by("5", player1), 
      occupied_cell_by("6", player2), occupied_cell_by("7", player1), occupied_cell_by("8", player2), 
    ]
  end
  
  def self.top_row_won_by(player)
    [
      occupied_cell_by("0", player), occupied_cell_by("1", player), occupied_cell_by("2", player),
      Cell.new("3"), Cell.new("4"), Cell.new("5"), 
      Cell.new("6"), Cell.new("7"), Cell.new("8")
    ]
  end
  
  def self.bottom_row_won_by(player)
    [
      Cell.new("0"), Cell.new("1"), Cell.new("2"), 
      Cell.new("3"), Cell.new("4"), Cell.new("5"), 
      occupied_cell_by("6", player), occupied_cell_by("7", player), occupied_cell_by("8", player),
    ]
  end
  
  def self.diagonal_from_left_top_won_by(player)
    [
      occupied_cell_by("0", player), Cell.new("1"), Cell.new("2"),
      Cell.new("3"), occupied_cell_by("4", player), Cell.new("5"), 
      Cell.new("6"), Cell.new("7"), occupied_cell_by("8", player), 
    ]
  end
  
  def self.diagonal_from_right_top_won_by(player)
    [
      Cell.new("0"), Cell.new("1"), occupied_cell_by("2", player),
      Cell.new("3"), occupied_cell_by("4", player), Cell.new("5"), 
      occupied_cell_by("6", player), Cell.new("7"), Cell.new("8") 
    ]
  end
  
  def self.fill_cell_0_to_win(player)
    [
      Cell.new("0"), occupied_cell_by("1", player), occupied_cell_by("2", player),
      Cell.new("3"), Cell.new("4"), Cell.new("5"), 
      Cell.new("6"), Cell.new("7"), Cell.new("8"), 
    ]
  end
  
  def self.one_cell_empty(cell_index)
	  board = Boards.tie_board
	  board[cell_index] = Cell.new(cell_index.to_s)
	  board
  end
  
  def self.two_cells_empty(cell_index, cell_index1)
	  board = Boards.tie_board
	  board[cell_index] = Cell.new(cell_index.to_s)
	  board[cell_index1] = Cell.new(cell_index1.to_s)
	  board
  end
    
  private
  
  def self.occupied_cell_by(cell_char, player)
    cell = Cell.new(cell_char)
    cell.set_to(player)
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