class Cell < String
  
  def initialize(content)
    @initial_content = content
    self[0] = content[0]
    super(content)
  end
  
  def is_available?
    self == @initial_content
  end
  
  def set_to(content)
    self[0] = content[0]
  end
  
end
