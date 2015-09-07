class GameRules
  
  def initialize(board)
    @board = board
  end

  def won?
    has_completed_row || has_completed_column || has_completed_diagonal
  end
  
  def game_over?
    won? or tie?
  end
  
  def tie?
      @board.all? { |cell| !cell.is_available? }
  end
  
  private
  
  def has_completed_row
    board = @board
    [board[0], board[1], board[2]].uniq.length == 1 ||
    [board[3], board[4], board[5]].uniq.length == 1 ||
    [board[6], board[7], board[8]].uniq.length == 1
  end

  def has_completed_column
    board = @board
    [board[0], board[3], board[6]].uniq.length == 1 ||
    [board[1], board[4], board[7]].uniq.length == 1 ||
    [board[2], board[5], board[8]].uniq.length == 1
  end
  
  def has_completed_diagonal
    board = @board
    [board[0], board[4], board[8]].uniq.length == 1 ||
    [board[2], board[4], board[6]].uniq.length == 1
  end

end