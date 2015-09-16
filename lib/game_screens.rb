require_relative "./board_output"
require_relative "./colorize"
require_relative "./external-deps/io"

class GameScreens
  
  INSTRUCTIONS = [
    "Welcome to my Tic Tac Toe game",
    "The goal is to get three in a row, column or diagonal.",
    "Hit the number of the cell you want to claim."
  ].join("\n")
  PLEASE_SELECT_CELL = "Please select your cell:"
  GAME_OVER = "Game over"
  
  def initizalize(io=IO.new)
    @io = io
  end
  
  def game_start(board)
    clear_screen
    @io.print_string INSTRUCTIONS
    print_board(board)
    @io.print_string PLEASE_SELECT_CELL
  end

  def next_move_screen(board)
    board_screen(board)
    @io.print_string PLEASE_SELECT_CELL
  end
  
  def invalid_cell(cell_index)
    @io.print_string "Ooops, the cell #{Colorize.red(cell_index.to_s)} is not valid or available, please choose again."
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
    @io.print_string "#{winner} has won. Congratulations."
  end
  
  def game_over_with_tie(board)
    game_over_screen(board)
    @io.print_string "Tie, nobody won, but everyone had fun!"
  end
  
  def game_over_screen(board)
    board_screen(board)
    @io.print_string GAME_OVER
  end
  
  def board_screen(board)
    clear_screen
    empty_lines 3
    print_board(board)
  end
  
  def clear_screen
    @io.clear_screen
  end
  
  def print_board(board)
    empty_line
    BoardOutput.print(board)
    empty_line
  end 
  
  def empty_line
    @io.print_string
  end
  
  def empty_lines(how_many)
    how_many.times do empty_line end
  end
  
end

