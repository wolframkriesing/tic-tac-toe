require_relative "./winning_move"
require_relative "./random_move"

class ComputerMove
  
  def initialize(board, computer_player, human_player)
    @board = board
    @computer_player = computer_player
    @human_player = human_player
  end

  def pick_cell
    if @board[4].is_available?
      return 4
    end
    
    winning_or_random_move
  end
  
  private
  
  def winning_or_random_move
    winning_move = WinningMove.new(@board)    
    winning_move.pick_cell(@computer_player) ||
    winning_move.pick_cell(@human_player) ||
    RandomMove.new(@board).pick_cell
  end
  
end