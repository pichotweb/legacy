require 'gosu'
require File.expand_path(File.dirname(__FILE__) + '/player') 

class GameWindow < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = "Legacy v 0.0.0"

	@background_image = Gosu::Image.new( self, "data/graphics/oldman.png", true )

	@player = Player.new(self)
	@player.warp(320, 240)
  end
  
  def update #updated 0 times per second, the main game goes here

  	if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
  		@player.turn_left
  	end

  	if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
  		@player.turn_right
  	end

  	if button_down? Gosu::KbUp or button_down? Gosu::GpButton0 then
      @player.accelerate
    end

    @player.move
  end
  
  def draw #redraw the whole screen, no fuck logic here
  	@player.draw
  	@background_image.draw(0, 0, 0)
  end

  def button_down(id)
  	if id == Gosu::KbEscape
  		close
  	end
  end

end

window = GameWindow.new
window.show