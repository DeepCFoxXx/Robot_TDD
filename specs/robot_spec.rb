require('minitest/autorun')
require('minitest/rg')
require_relative('../robot.rb')
require_relative('../grid.rb')


class TestRobot < MiniTest::Test

  def setup
    @grid = Grid.new(11, 11)
    @robot1 = Robot.new('1 1 E', @grid)
    @robot2 = Robot.new('1 1 E', @grid)
    @robot3 = Robot.new('3 2 N', @grid)
    @robot4 = Robot.new('0 3 W', @grid)
  end

  def test_get_starting_position
    assert_equal('1 1 E', @robot1.get_position)
  end

end
