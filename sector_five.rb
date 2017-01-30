require 'Gosu'
require_relative 'player'
require_relative 'enemy'
require_relative 'bullet'
require_relative 'explosion'

class SectorFive < Gosu::Window
  WIDTH           = 1200
  HEIGHT          = 600
  ENEMY_FREQUENCY = 0.015
  def initialize
    super(WIDTH, HEIGHT)
    self.caption    = 'Sector Five'
    @player         = Player.new(self) # self is the window here
    @enemies        = []
    @bullets        = []
    @explosions     = []
  end

  def update
    @player.turn_left if button_down?(Gosu::KB_LEFT)
    @player.turn_right if button_down?(Gosu::KB_RIGHT)
    @player.accelerate if button_down?(Gosu::KB_UP)
    @player.move
    if rand < ENEMY_FREQUENCY
      @enemies.push(Enemy.new(self))
    end
    @enemies.each(&:move)
    @bullets.each(&:move)
    @enemies.each do |enemy|
      @bullets.each do |bullet|
        distance = Gosu.distance(enemy.x, enemy.y, bullet.x, bullet.y)
        if distance < enemy.radius + bullet.radius
          @explosions << Explosion.new(self, enemy.x, enemy.y)
          @enemies.delete enemy
          @bullets.delete bullet
        end
      end
    end
    @explosions.each do |explosion|
      @explosions.delete explosion if explosion.finished
    end
    @bullets.each do |bullet|
      @bullets.delete bullet unless bullet.onscreen?
    end
    @enemies.each do |enemy|
      @enemies.delete enemy  if enemy.y > HEIGHT + enemy.radius
      end
  end

  def draw
    @player.draw
    @enemies.each(&:draw)
    @bullets.each(&:draw)
    @explosions.each(&:draw)
  end

  def button_down(id)
    if id == Gosu::KbSpace
      @bullets.push(Bullet.new(self, @player.x, @player.y, @player.angle))
    end
  end
end

window = SectorFive.new
window.show
