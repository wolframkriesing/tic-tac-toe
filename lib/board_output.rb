class BoardOutput 
  
  LEFT_MARGIN = "       "
  
  def initialize(io)
    @io = io
  end
  
  def print(board)
    print_empty_line
    print_board_border
    print_board_line(board, 0, 1, 2)
    print_board_border
    print_board_line(board, 3, 4, 5)
    print_board_border
    print_board_line(board, 6, 7, 8)
    print_board_border
    print_empty_line
  end

  private
  
  def print_board_line(board, cell1, cell2, cell3)
    print_line "| #{print_cell(board, cell1)} | #{print_cell(board, cell2)} | #{print_cell(board, cell3)} |"
  end
  
  def print_cell(board, index)
    cell = board.cells[index]
    cell.is_available? ? index.to_s : cell.player
  end
  
  def print_board_border
    print_line "+---+---+---+"
  end
  
  def print_line(line)
    @io.put_string LEFT_MARGIN + line
  end
  
  def print_empty_line
    @io.put_string
  end
end

