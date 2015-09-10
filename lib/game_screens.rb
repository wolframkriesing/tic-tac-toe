require_relative "./board_output"

class GameScreens
  
  INSTRUCTIONS = [
    "Welcome to my Tic Tac Toe game",
    "The goal is to get three in a row, column or diagonal.",
    "Hit the number of the cell you want to claim."
  ].join("\n")
  PLEASE_SELECT_CELL = "Please select your cell:"
  GAME_OVER = "Game over"
  
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
  
  def invalid_cell(cell_index)
    puts "Ooops, the cell #{cell_index.to_s.red} is not valid or available, please choose again."
  end
  
  def game_over(board, winner)
    if winner
      game_won(board, winner)
    else
      game_over_with_tie(board)
    end
  end
  
  private
  
  def game_won(board, winner)
    game_over_screen(board)
    puts "#{winner} has won. Congratulations."
  end
  
  def game_over_with_tie(board)
    game_over_screen(board)
    puts "Tie, nobody won, but everyone had fun!"
  end
  
  def game_over_screen(board)
    board_screen(board)
    puts GAME_OVER
  end
  
  def board_screen(board)
    clear_screen
    empty_lines 3
    print_board(board)
  end
  
  def clear_screen
    system("clear")
  end
  
  def print_board(board)
    BoardOutput.print(board)
  end 
  
  def empty_line
    puts
  end
  
  def empty_lines(how_many)
    how_many.times do empty_line end
  end
  
end

