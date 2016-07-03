require 'fast_blank'

module Bloqus
  Coordinate = Struct.new(:x, :y)

  module Colors
    BLUE = 'blue'
    YELLOW = 'yellow'
    RED = 'red'
    GREEN = 'green'
  end

  module Rotations
    ZERO = 0
    NINETY = 1
    ONE_EIGHTY = 2
    TWO_SEVENTY = 3

    # 'flipped' along the Y axis
    FLIPPED_ZERO = 4
    FLIPPED_NINETY = 5
    FLIPPED_ONE_EIGHTY = 6
    FLIPPED_TWO_SEVENTY = 7
  end
end

require 'bloqus/coordinate'
require 'bloqus/board'
require 'bloqus/game'
require 'bloqus/piece'
require 'bloqus/piece_placement'
require 'bloqus/rotated_piece'
require 'bloqus/version'
