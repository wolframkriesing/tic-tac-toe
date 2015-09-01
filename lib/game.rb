class Game
  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    @computer_character = "X"
    @human_character = "O"
  end

  def start_game
    system("clear")
    puts "Welcome to my Tic Tac Toe game"
    print_board(@board)
    puts "Please select your cell."
    game_play_loop(@board)
    puts "Game over"
  end

  def print_board_line(board)
    puts "| #{board[0]} | #{board[1]} | #{board[2]} |"
  end
  
  def print_board_border
    puts "+---+---+---+"
  end

  def print_board(board)
    puts
    print_board_border
    print_board_line(board[0..2])
    print_board_border
    print_board_line(board[3..5])
    print_board_border
    print_board_line(board[6..8])
    print_board_border
    puts
  end

  def game_play_loop(board)
    until is_game_over(board) || tie(board)
      get_human_spot(board)
      if !is_game_over(board) && !tie(board)
        computer_move(board)
      end
      system("clear")
      puts
      print_board(board)
    end
  end
  
  def is_available(cell)
    cell != @human_character && cell != @computer_character
  end

  def get_human_spot(board)
    cell = nil
    until cell
      cell = gets.chomp.to_i
      if is_available(board[cell])
        board[cell] = @human_character
      else
        cell = nil
      end
    end
  end

  def computer_move(board)
    cell = nil
    until cell
      if board[4] == "4"
        cell = 4
        board[cell] = @computer_character
      else
        cell = get_best_move(board)
        if is_available(board[cell])
          board[cell] = @computer_character
        else
          cell = nil
        end
      end
    end
  end

  def all_available_cells_indexes(board)
    available_cells_indexes = board.select { |cell| is_available(cell) }
    available_cells_indexes.map { |cell| cell.to_i }
  end
  
  def would_win(board, cell_index, character)
    possible_board = [].concat(board)
    possible_board[cell_index] = character
    is_game_over(possible_board)
  end
  
  def would_computer_win(board, cell_index)
    would_win(board, cell_index, @computer_character)
  end

  def would_human_win(board, cell_index)
    would_win(board, cell_index, @human_character)
  end

  def is_winning_move(board, cell_index)
    would_computer_win(board, cell_index) or would_human_win(board, cell_index)
  end

  def winning_move(board, available_cells_indexes)
    cells_that_would_make_a_win = available_cells_indexes.select { |cell_index| 
      is_winning_move(board, cell_index) 
    }
    cells_that_would_make_a_win.first
  end
  
  def get_best_move(board)
    available_cells_indexes = all_available_cells_indexes(board)
    cell_for_winning_move = winning_move(board, available_cells_indexes)
    if cell_for_winning_move
      return cell_for_winning_move
    end
    random_move(available_cells_indexes)    
  end
  
end

def random_move(available_cells_indexes) 
  n = rand(0..available_cells_indexes.count)
  available_cells_indexes[n].to_i
end

def tie(board)
  board.all? { |cell| cell == "X" || cell == "O" }
end

def is_game_over(board)
  any_complete_row(board) || any_complete_column(board) || any_diagonal_complete(board)
end

def any_complete_row(board)
  [board[0], board[1], board[2]].uniq.length == 1 ||
  [board[3], board[4], board[5]].uniq.length == 1 ||
  [board[6], board[7], board[8]].uniq.length == 1
end

def any_complete_column(board)
  [board[0], board[3], board[6]].uniq.length == 1 ||
  [board[1], board[4], board[7]].uniq.length == 1 ||
  [board[2], board[5], board[8]].uniq.length == 1
end

def any_diagonal_complete(board)
  [board[0], board[4], board[8]].uniq.length == 1 ||
  [board[2], board[4], board[6]].uniq.length == 1
end
