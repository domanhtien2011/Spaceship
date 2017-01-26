require 'Gosu'
require_relative 'player'

class SectorFive < Gosu::Window
  def initialize
    super(1200, 600)
    self.caption = 'Sector Five'
    @player = Player.new(self) # self is the window here
  end

  def update
    @player.turn_left if button_down?(Gosu::KB_LEFT)
    @player.turn_right if button_down?(Gosu::KB_RIGHT)
    @player.accelerate if button_down?(Gosu::KB_UP)
    @player.move
  end

  def draw
    @player.draw
  end
end

window = SectorFive.new
window.show
