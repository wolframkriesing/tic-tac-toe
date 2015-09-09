class GameScreens
  
  def initialize(board_output)
    @board_output = board_output
  end
  
  def game_start(board)
    clear_screen
    puts "Welcome to my Tic Tac Toe game"
    puts "The goal is to get three in a row, column or diagonal."
    puts "Hit the number of the cell you want to claim."
    print_board(board)
    puts "Please select your cell:"
  end

  def board_screen(board)
    clear_screen
    empty_lines 3
    print_board(board)
    puts "Please select your cell:"
  end
  
  def game_over
    puts "Game over"
  end
  
  private
  
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

