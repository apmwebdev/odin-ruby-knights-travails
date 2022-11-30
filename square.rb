class Square
  MAX_COORD = 7

  attr_accessor :coords, :adjacent_coords, :adjacent_squares, :parent

  def initialize(coords)
    @coords = coords
    @adjacent_coords = []
    determine_adjacent_coords
    @adjacent_squares = []
    @parent = nil
  end

  private

  def determine_adjacent_coords
    x = coords[0]
    y = coords[1]
    @adjacent_coords.push([x + 2, y + 1]) if coords_valid?([x + 2, y + 1])
    @adjacent_coords.push([x + 2, y - 1]) if coords_valid?([x + 2, y - 1])
    @adjacent_coords.push([x - 2, y + 1]) if coords_valid?([x - 2, y + 1])
    @adjacent_coords.push([x - 2, y - 1]) if coords_valid?([x - 2, y - 1])
    @adjacent_coords.push([x + 1, y + 2]) if coords_valid?([x + 1, y + 2])
    @adjacent_coords.push([x + 1, y - 2]) if coords_valid?([x + 1, y - 2])
    @adjacent_coords.push([x - 1, y + 2]) if coords_valid?([x - 1, y + 2])
    @adjacent_coords.push([x - 1, y - 2]) if coords_valid?([x - 1, y - 2])
  end

  def coords_valid?(coords)
    coords.all? { |coord| coord < MAX_COORD && coord >= 0 }
  end
end
