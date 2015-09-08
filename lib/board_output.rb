class BoardOutput 
  
  LEFT_MARGIN = "   "
  
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

  private
  
  def self.print_board_line(board, cell1, cell2, cell3)
    print_line "| #{print_cell(board, cell1)} | #{print_cell(board, cell2)} | #{print_cell(board, cell3)} |"
  end
  
  def self.print_cell(board, index)
    cell = board[index]
    cell.is_available? ? index.to_s : cell.player
  end
  
  def self.print_board_border
    print_line "+---+---+---+"
  end
  
  def self.print_line(line)
    puts LEFT_MARGIN + line
  end
end

