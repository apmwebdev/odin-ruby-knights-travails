class Board
  attr_reader :squares

  def initialize
    @squares = []
    create_board
  end

  def reset_parents
    @squares.each { |square| square.parent = nil }
  end

  private

  def create_board
    rows = (0..7).to_a
    cols = (0..7).to_a
    board = rows.product(cols)
    board.each do |coords|
      @squares.push(Square.new(coords))
    end
    @squares.each { |square| link_adjacent_squares(square) }
  end

  def link_adjacent_squares(square)
    square.adjacent_coords.each do |coords|
      coord_square = @squares.find { |s| s.coords == coords }
      square.adjacent_squares.push(coord_square)
    end
  end
end
