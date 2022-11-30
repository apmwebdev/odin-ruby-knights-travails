require_relative "knight"
require_relative "board"
require_relative "square"

k = Knight.new
p k.determine_shortest_path([0, 0], [1, 2])
p k.determine_shortest_path([0, 0], [3, 3])
p k.determine_shortest_path([3, 3], [0, 0])
