class GameScreens
  
  def initialize(board_output)
    @board_output = board_output
  end
  
  def game_start(board)
    clear_screen
    puts "Welcome to my Tic Tac Toe game"
    print_board(board)
    puts "Please select your cell."
  end

  def board_screen(board)
    clear_screen
    empty_line
    print_board(board)
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
  
end

