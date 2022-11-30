class Knight
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def determine_shortest_path(start, end_pos, queue = [], prev = [])
    if !queue.empty?
      if queue.first.coords == end_pos
        trace_path(queue.first)
      else
        queue.first.adjacent_squares.each do |square|
          unless prev.include?(square)
            square.parent = queue.first
            queue.push(square)
          end
        end
        prev.push(queue.shift)
        determine_shortest_path(start, end_pos, queue, prev)
      end
    elsif start.is_a?(Array)
      @board.reset_parents
      start_sq = @board.squares.find { |s| s.coords == start }
      determine_shortest_path(start_sq, end_pos, [start_sq])
    end
  end

  private

  def trace_path(square, return_arr = [])
    return_arr.unshift(square.coords)
    if square.parent
      trace_path(square.parent, return_arr)
    else
      return_arr
    end
  end
end
