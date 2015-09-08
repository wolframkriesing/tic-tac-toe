class Player

  def initialize(name)
    @name = name
  end

  def is?(other_player)
    other_player == self
  end

  def to_s
    return @name
  end

end

class HumanPlayer < Player
  
  def next_move(board, opponent)
    cell = nil
    until cell
      cell = gets.chomp.to_i
      if board[cell].is_available?
        return cell
      else
        cell = nil
      end
    end
  end
  
end

require_relative "./computer_move"
class ComputerPlayer < Player
  
  def next_move(board, opponent)
    computer_move = ComputerMove.new(board, self, opponent)
    computer_move.pick_cell
  end
  
end
