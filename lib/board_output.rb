class BoardOutput 
  
  def self.print(board)
    puts
    print_board_border
    print_board_line(board, 0, 1, 2)
    print_board_border
    print_board_line(board, 3, 4, 5)
    print_board_border
    print_board_line(board, 6, 7, 8)
    print_board_border
    puts
  end
  
end

def print_board_line(board, cell1, cell2, cell3)
  puts "| #{print_cell(board, cell1)} | #{print_cell(board, cell2)} | #{print_cell(board, cell3)} |"
end

def print_cell(board, index)
  cell = board[index]
  cell.is_available? ? index.to_s : cell.player.name
end

def print_board_border
  puts "+---+---+---+"
end
