require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super 640, 480, false
    self.caption = "Legacy v 0.0.0"
  end
  
  def update #updated 0 times per second, the main game goes here
  end
  
  def draw #redraw the whole screen, no fuck logic here
  end
end

window = GameWindow.new
window.show