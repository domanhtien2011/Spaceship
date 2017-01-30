class Enemy
  attr_reader :x, :y, :radius
  def initialize(window)
    @radius = 20
    @x = rand(window.width - 2 * @radius) + @radius
    @y = 0
    @image = Gosu::Image.new('images/enemy.png')
    @window = window
    @speed = 4
  end

  def draw
    # Use draw_rot method to draw the image with a customized angle
    @image.draw(@x, @y , 1)
  end

  def move
    @y += @speed
  end
end