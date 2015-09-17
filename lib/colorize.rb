class Colorize

  RED = 31
  GREEN = 32

  def self.colorize(character, color_code)
    "\e[#{color_code}m#{character}\e[0m"
  end

  def self.red(character)
    colorize(character, RED)
  end

  def self.green(character)
    colorize(character, GREEN)
  end
  
end
