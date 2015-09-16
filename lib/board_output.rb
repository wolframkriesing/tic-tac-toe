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
    cell.is_available? ? index.to_s : cell.player
  end
  
  def print_board_border
    line = "+"
    @board.rows_count.times { line += "---+" }
    print_line line
  end
  
  def print_line(line)
    @output.print_string LEFT_MARGIN + line
  end
  
end

