require 'Gosu'
require_relative 'player'
require_relative 'enemy'

class SectorFive < Gosu::Window
  WIDTH = 1200
  HEIGHT = 600
  def initialize
    super(WIDTH, HEIGHT)
    self.caption = 'Sector Five'
    @player = Player.new(self) # self is the window here
    @enemies = []
    3.times do |_|
      @enemies << Enemy.new(self, rand(30))
    end
  end

  def update
    @player.turn_left if button_down?(Gosu::KB_LEFT)
    @player.turn_right if button_down?(Gosu::KB_RIGHT)
    @player.accelerate if button_down?(Gosu::KB_UP)
    @player.move
    @enemies.each(&:move)
  end

  def draw
    @player.draw
    @enemies.each(&:draw)
  end
end

window = SectorFive.new
window.show
