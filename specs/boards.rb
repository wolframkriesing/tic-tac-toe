require_relative "../lib/cell"

class Boards
	
  def self.player1
	"X"
  end
  
  def self.player2 
	"O"
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
  
  def self.empty_board
	[
		Cell.new("0"), Cell.new("1"), Cell.new("2"),
		Cell.new("3"), Cell.new("4"), Cell.new("5"), 
		Cell.new("6"), Cell.new("7"), Cell.new("8"), 
	]
  end
  
  def self.tie_board
	[
		occupied_cell_by("0", "X"), occupied_cell_by("1", "O"), occupied_cell_by("2", "O"), 
		occupied_cell_by("3", "O"), occupied_cell_by("4", "X"), occupied_cell_by("5", "X"), 
		occupied_cell_by("6", "O"), occupied_cell_by("7", "X"), occupied_cell_by("8", "O"), 
	]
  end
  
  def self.top_row_won_by(player)
	[
		occupied_cell_by("0", player), occupied_cell_by("1", player), occupied_cell_by("2", player),
		Cell.new("3"), Cell.new("4"), Cell.new("5"), 
		Cell.new("6"), Cell.new("7"), Cell.new("8"), 
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
  
  private
  
  def self.occupied_cell_by(cell_char, player)
	cell = Cell.new(cell_char)
	cell.set_to(player)
	cell
  end

end

