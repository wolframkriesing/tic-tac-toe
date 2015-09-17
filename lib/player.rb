require_relative "./external-deps/input"

class Player

  def initialize(name, input = Input.new)
    @name = name
    @input = input
  end

  def is?(other_player)
    other_player == self
  end

  def to_s
    return @name
  end

end

class HumanPlayer < Player
  
  def pick_cell(board, opponent)
    char = @input.get_string
    if char.to_i.to_s == char
      return char.to_i - 1
    end
    char
  end
  
end

require_relative "./computer_move"
class ComputerPlayer < Player

  def set_move_class(klass)
    @computer_move = klass
  end
  
  def move_class
    @computer_move || ComputerMoveMedium
  end

  def pick_cell(board, opponent)
    computer_move = move_class.new(board, self, opponent)
    computer_move.pick_cell
  end
  
end
