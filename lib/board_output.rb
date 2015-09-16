class BoardOutput 
  
  LEFT_MARGIN = "       "
  
  def initialize(io)
    @io = io
  end
  
  def print(board)
    @board = board
    print_empty_line
    print_board_border
    print_rows
    print_empty_line
  end

  private
  
  def print_rows
    @board.rows_count.times do |row_index|
      print_row(row_index)
    end
  end
  
  def print_row(row_index)
    offset = row_index * @board.rows_count
    print_board_line([offset + 0, offset + 1, offset + 2])
    print_board_border
  end
  
  def print_board_line(cell_indexes)
    line = "|"
    cell_indexes.each do |cell_index|
      line += " #{print_cell(cell_index)} |"
    end
    print_line line
  end
  
  def print_cell(index)
    cell = @board.cells[index]
    cell.is_available? ? index.to_s : cell.player
  end
  
  def print_board_border
    line = "+"
    @board.rows_count.times { line += "---+" }
    print_line line
  end
  
  def print_line(line)
    @io.put_string LEFT_MARGIN + line
  end
  
  def print_empty_line
    @io.put_string
  end
end

