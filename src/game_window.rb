require 'gosu'
require File.expand_path(File.dirname(__FILE__) + '/../lib/ZOrder') 
require File.expand_path(File.dirname(__FILE__) + '/player') 
require File.expand_path(File.dirname(__FILE__) + '/star') 

class GameWindow < Gosu::Window
  
  include ZOrder

  def initialize
    super(640, 480, false)
    self.caption = "Legacy v 0.0.0"

	@background_image = Gosu::Image.new( self, "data/graphics/bg.png", true )

	@player = Player.new(self)
	@player.warp(320, 240)

	@star_anim = Gosu::Image.new(self, 'data/graphics/coin.png', false)
	@stars = Array.new
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
    @player.collect_stars(@stars)

    if rand(100) < 4 and @stars.size < 25 then
    	@stars.push( Star.new( @star_anim ) )
	end

	@star_anim.draw(0, 0, 0)

  end
  
  def draw #redraw the whole screen, no fuck logic here
  	
  	@background_image.draw(0, 0, ZOrder::Background)
  	@player.draw
  	@stars.each { |stars| stars.draw }
  end

  def button_down(id)
  	if id == Gosu::KbEscape
  		close
  	end
  end

end

window = GameWindow.new
window.show