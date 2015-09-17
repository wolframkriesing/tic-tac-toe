require_relative "external-deps/input"
require_relative "colorize"
require_relative "computer_move"

class Player
  
  attr_reader :name

  def initialize(name, input = Input.new)
    @name = name
    @input = input
    @color = nil
  end

  def is?(other_player)
    other_player == self
  end

  def to_s
    return @color ? Colorize.colorize(@name, @color) : @name
  end
  
  def set_color(color)
    @color = color
  end

end

class HumanPlayer < Player
  
  def pick_cell(board, opponent = nil)
    char = @input.get_string
    begin
      return Integer(char) - 1
    rescue
      return char
    end
  end
  
end

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
