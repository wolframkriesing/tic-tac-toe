class MyInput
	
  def initialize(moves)
    if moves.class == Array
      @moves = moves
    else
  	  @moves = moves.split("")
    end
  end
	
  def get_string
    return @moves.pop
  end
end
