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

  def test_get_orientation_index
    assert_equal(1, @robot1.get_orientation_index)
  end

  def test_change_orientation__left_east_to_north
    @robot1.change_orientation('L')
    assert_equal('1 1 N', @robot1.get_position)
  end

  def test_change_orientation__right_east_to_south
    @robot1.change_orientation('R')
    assert_equal('1 1 S', @robot1.get_position)
  end

  def test_move_forwards__east
    @robot1.change_coords('F')
    assert_equal('2 1 E', @robot1.get_position)
  end

  def test_turn_and_move__right_east_to_south
    @robot1.change_orientation('R')
    @robot1.change_coords('F')
    assert_equal('1 0 S', @robot1.get_position)
  end

  def test_carry_out_instructions
    @robot1.carry_out_instructions('RF')
    assert_equal('1 0 S', @robot1.get_position)
  end

  def test_carry_out_instructions__full_circle
    @robot1.carry_out_instructions('RFRFRFRF')
    assert_equal('1 1 E', @robot1.get_position)
  end

  def test_check_on_grid__false
    @robot1.carry_out_instructions('RFF')
    assert_equal(false, @robot1.on_grid?)
  end

  def test_check_on_grid__true
    assert_equal(true, @robot1.on_grid?)
  end

end
