class Player
 ROTATION_SPEED = 3
 ACCELERATION   = 2
 FRICTION       = 0.9
  def initialize(window)
    @x          = 600
    @y          = 580
    @angle      = 0
    @image      = Gosu::Image.new('images/ship.png')
    @velocity_x = 0
    @velocity_y = 0
    @window     = window
    @radius     = 20
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

  def accelerate
    @velocity_x += Gosu.offset_x(@angle, ACCELERATION)
    @velocity_y += Gosu.offset_y(@angle, ACCELERATION)
  end

  def move
    @velocity_x *= FRICTION
    @velocity_y *= FRICTION
    @x += @velocity_x
    @y += @velocity_y
    if @x > @window.width - @radius
      @velocity_x = 0
      @x = @window.width - @radius # so the whole ship is in the window screen
    end
    if @x < @radius
      @velocity_x = 0
      @x = @radius # so the whole ship is in the window screen
    end
    if @y > @window.height - @radius
      @velocity_y = 0
      @y = @window.height - @radius # so the whole ship is in the window screen
    end
  end

  def turn_right
    @angle += ROTATION_SPEED
  end

  def turn_left
    @angle -= ROTATION_SPEED
  end
end