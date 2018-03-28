require('minitest/autorun')
require('minitest/rg')
require_relative('../grid.rb')
require_relative('../robot.rb')

class TestGrid < MiniTest::Test

  def setup
    @grid = Grid.new(11, 11)
    @robot = Robot.new('1 1 E', @grid)
  end

end
