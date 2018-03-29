class Robot

  def initialize(start_position, grid)
    position = start_position.split(" ")
    @x = position[0].to_i
    @y = position[1].to_i
    @orientation = position[2]
    @grid = grid
    @movements = {
      'N' => [0, 1],
      'E' => [1, 0],
      'S' => [0, -1],
      'W' => [-1, 0]
    }
    @orientations = ['N', 'E', 'S', 'W']
    @prev_x = nil
    @prev_y = nil
  end

  def get_position
    return "#{@prev_x} #{@prev_y} #{@orientation} LOST" if !on_grid?
    return "#{@x} #{@y} #{@orientation}"
  end

  def on_grid?
    return @x <= @grid.x && @y <= @grid.y && @x >= 0 && @y >= 0
  end

end
