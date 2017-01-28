class Enemy
  def initialize(window, angle)
    @radius = 20
    @x = rand(window.width - 2 * @radius) + @radius
    @y = 0
    @image = Gosu::Image.new('images/enemy.png')
    @window = window
    @speed = 1
    @angle = angle
    @velocity_x = 0
    @velocity_y = 0
  end

  def draw
    @image.draw_rot(@x, @y , 1, @angle)
  end

  def move
    @velocity_x += Gosu.offset_x(@angle, @speed) * 0.05
    @velocity_y += Gosu.offset_y(@angle, @speed) * 0.05
    @x          -= @velocity_x
    @y          -= @velocity_y
    # if @y < 0
    #   @speed *= -1
    # end
  end
end