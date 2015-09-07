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
    cells_equal?(0, 1, 2) ||
    cells_equal?(3, 4, 5) ||
    cells_equal?(6, 7, 8)
  end

  def has_completed_column
    cells_equal?(0, 3, 6) ||
    cells_equal?(1, 4, 7) ||
    cells_equal?(2, 5, 8)
  end
  
  def has_completed_diagonal
    cells_equal?(0, 4, 8) ||
    cells_equal?(2, 4, 6)
  end
  
  def cells_equal?(cell1, cell2, cell3)
    @board[cell1] == @board[cell2] && @board[cell2] == @board[cell3]
  end

end