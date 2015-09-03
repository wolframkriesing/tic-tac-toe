class BoardOutput 
  
  def self.print(board)
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
  
end

def print_board_line(board)
  puts "| #{board[0]} | #{board[1]} | #{board[2]} |"
end

def print_board_border
  puts "+---+---+---+"
end
