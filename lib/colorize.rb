class Colorize

  def self.colorize(character, color_code)
    "\e[#{color_code}m#{character}\e[0m"
  end

  def self.red(character)
    colorize(character, 31)
  end

  def self.green(character)
    colorize(character, 32)
  end
  
end
