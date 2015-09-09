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

  def pick_cell(board, opponent)
    computer_move = ComputerMoveMedium.new(board, self, opponent)
    computer_move.pick_cell
  end
  
end
  
class ComputerPlayerMedium < ComputerPlayer  
end
