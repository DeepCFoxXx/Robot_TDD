require('minitest/autorun')
require('minitest/rg')
require_relative('../grid.rb')
require_relative('../robot.rb')

class TestGrid < MiniTest::Test

  def setup
    @grid = Grid.new(11, 11)
    @robot = Robot.new('1 1 E', @grid)
  end

  def test_grid_x
    assert_equal(12, @grid.dimensions.size)
  end

  def test_grid_y
    assert_equal(12, @grid.dimensions[11].size)
  end

  def test_warning_false
    assert_equal(false, @grid.has_warning?(1, 1))
  end

  def test_warning_true
    @grid.dimensions[1][1] = 'x'
    assert_equal(true, @grid.has_warning?(1, 1))
  end

end
