require_relative "external-deps/input"
require_relative "colorize"
require_relative "computer_move"

class Player
  
  attr_reader :name

  def initialize(name)
    @name = name
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
  
  def initialize(name, input = Input.new)
    super(name)
    @input = input
  end
  
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

  def initialize(name, klass = ComputerMoveMedium)
    super(name)
    @move_class = klass
  end
  
  def pick_cell(board, opponent)
    @move_class.new(board, self, opponent).pick_cell
  end
  
end
