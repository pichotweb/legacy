class Player
  def initialize(window)
    @window = window
    @image = Gosu::Image.new( window, "data/graphics/neo.png", true, 0 , 0, 33, 33)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def score
  	@score
  end

  def collect_stars( stars )
  	if stars.reject! { |stars| Gosu::distance(@x, @y, stars.x, stars.y) < 35 } then
  		@score+=1
  	end
  end

  def warp(x, y)
    @x, @y = x, y
  end
  
  def turn_left
    @angle -= 4.5
  end
  
  def turn_right
    @angle += 4.5
  end
  
  def accelerate
    @vel_x += Gosu::offset_x(@angle, 0.5)
    @vel_y += Gosu::offset_y(@angle, 0.5)
  end
  
  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 640
    @y %= 480
    
    @vel_x *= 0.95
    @vel_y *= 0.95
  end

  def draw
    # @image.draw_rot(@x, @y, 1, @angle)
    @star_anim = Gosu::Image::load_tiles(@window, 'data/graphics/neo.png', 33, 33, true)

    img = @star_anim[Gosu::milliseconds / 100 % @star_anim.size];
    img.draw(@x - img.width / 2.0, @y - img.height / 2.0,
        ZOrder::Stars, 1, 1, 0xffffffff, :add)
  end
end