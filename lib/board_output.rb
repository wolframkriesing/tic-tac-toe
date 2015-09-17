require_relative "./external-deps/output"

class BoardOutput
  
  LEFT_MARGIN = "       "
  
  def initialize(output = Output.new)
    @output = output
  end
  
  def print(board)
    @board = board
    print_top_boarder
    print_rows
  end

  private
  
  def print_top_boarder
    print_board_border
  end
  
  def print_rows
    @board.rows_count.times do |row_index|
      print_row(row_index)
    end
  end
  
  def print_row(row_index)
    rows_count = @board.rows_count
    offset = row_index * rows_count
    indexes = (offset .. (offset + rows_count-1))
    print_board_line(indexes)
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
    cell.is_available? ? (index + 1).to_s : cell.player
  end
  
  INTERSECTION_CHARACTER = "+"
  CELL_LINE_CHARACTER = "-"
  
  def print_board_border
    print_line INTERSECTION_CHARACTER + (cell_placeholder + INTERSECTION_CHARACTER) * @board.columns_count
  end
  
  def cell_placeholder
    cell_separator = CELL_LINE_CHARACTER * @board.cells.length.to_s.length
    CELL_LINE_CHARACTER + cell_separator + CELL_LINE_CHARACTER
  end
  
  def print_line(line)
    @output.print_string LEFT_MARGIN + line
  end
  
end

