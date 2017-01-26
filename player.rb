class Player
  def initialize(window)
    @x          = 600
    @y          = 580
    @angle      = 0
    @image      = Gosu::Image.new('images/ship.png')
    @velocity_x = 0
    @velocity_y = 0
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

  def accelerate
    @velocity_x += Gosu.offset_x(@angle, 2)
    @velocity_y += Gosu.offset_y(@angle, 2)
  end

  def move
    @velocity_x *= 0.8
    @velocity_y *= 0.8
    @x += @velocity_x
    @y += @velocity_y
  end

  def turn_right
    @angle += 3
  end

  def turn_left
    @angle -= 3
  end
end