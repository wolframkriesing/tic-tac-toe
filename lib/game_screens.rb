class GameScreens
  
  INSTRUCTIONS = [
    "Welcome to my Tic Tac Toe game",
    "The goal is to get three in a row, column or diagonal.",
    "Hit the number of the cell you want to claim."
  ].join("\n")
  PLEASE_SELECT_CELL = "Please select your cell:"
  GAME_OVER = "Game over"
  
  def initialize(board_output)
    @board_output = board_output
  end
  
  def game_start(board)
    clear_screen
    puts INSTRUCTIONS
    print_board(board)
    puts PLEASE_SELECT_CELL
  end

  def next_move_screen(board)
    board_screen(board)
    puts PLEASE_SELECT_CELL
  end

  def game_over(board)
    board_screen(board)
    puts GAME_OVER
  end
  
  private
  
  def board_screen(board)
    clear_screen
    empty_lines 3
    print_board(board)
  end
  
  def clear_screen
    system("clear")
  end
  
  def print_board(board)
    @board_output.print(board)
  end 
  
  def empty_line
    puts
  end
  
  def empty_lines(how_many)
    how_many.times do empty_line end
  end
  
end

