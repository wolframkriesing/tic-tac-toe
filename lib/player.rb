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
  
  def pick_cell(board, opponent)
    char = gets.chomp
    if char.to_i.to_s == char
      return char.to_i
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
