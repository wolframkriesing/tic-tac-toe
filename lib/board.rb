class Board < Array 
  
  def print()
    puts
    print_board_border
    print_board_line(self[0..2])
    print_board_border
    print_board_line(self[3..5])
    print_board_border
    print_board_line(self[6..8])
    print_board_border
    puts
  end
  
  def print_board_line(board)
    puts "| #{board[0]} | #{board[1]} | #{board[2]} |"
  end
  
  def print_board_border
    puts "+---+---+---+"
  end

end
