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
    puts "Please select your spot."
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
  
  def is_available(spot)
    spot != @human_character && spot != @computer_character
  end

  def get_human_spot(board)
    spot = nil
    until spot
      spot = gets.chomp.to_i
      if is_available(board[spot])
        board[spot] = @human_character
      else
        spot = nil
      end
    end
  end

  def computer_move(board)
    spot = nil
    until spot
      if board[4] == "4"
        spot = 4
        board[spot] = @computer_character
      else
        spot = get_best_move(board)
        if is_available(board[spot])
          board[spot] = @computer_character
        else
          spot = nil
        end
      end
    end
  end

  def all_available_cells(board)
    available_cells = board.select { |cell| is_available(cell) }
  end
  
  def would_win(board, cell_number, character)
    previous_cell_value = board[cell_number]
    board[cell_number] = character
    # possible_board = [] << board[0..cell_number-1] << [character] << board[cell_number+1..board.length-1]
    # return is_game_over(possible_board)
    would_win = is_game_over(board)
    board[cell_number] = previous_cell_value
    would_win
  end
  
  def would_computer_win(board, cell_number)
    would_win(board, cell_number, @computer_character)
  end

  def would_human_win(board, cell_number)
    would_win(board, cell_number, @human_character)
  end

  def is_best_move(board, cell_number)
    would_computer_win(board, cell_number) or would_human_win(board, cell_number)
  end

  def get_best_move(board)
    available_cells = all_available_cells(board)
    available_cells.each do |available_cell|
      cell_number = available_cell.to_i
      if is_best_move(board, cell_number)
        return cell_number
      end  
    end
    
    n = rand(0..available_cells.count)
    available_cells[n].to_i
  end

  def is_game_over(board)
    [board[0], board[1], board[2]].uniq.length == 1 ||
    [board[3], board[4], board[5]].uniq.length == 1 ||
    [board[6], board[7], board[8]].uniq.length == 1 ||
    [board[0], board[3], board[6]].uniq.length == 1 ||
    [board[1], board[4], board[7]].uniq.length == 1 ||
    [board[2], board[5], board[8]].uniq.length == 1 ||
    [board[0], board[4], board[8]].uniq.length == 1 ||
    [board[2], board[4], board[6]].uniq.length == 1
  end

  def tie(board)
    board.all? { |cell| cell == "X" || cell == "O" }
  end

end
