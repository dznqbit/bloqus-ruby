require 'fast_blank'

module Bloqus
  module Colors
    BLUE = :blue
    YELLOW = :yellow
    RED = :red
    GREEN = :green

    def self.all
      constants.map { |c| const_get(c) }
    end
  end

  module Rotations
    ZERO = :zero
    NINETY = :ninety
    ONE_EIGHTY = :one_eighty
    TWO_SEVENTY = :two_seventy

    # 'flipped' along the Y axis
    FLIPPED_ZERO = :flipped_zero
    FLIPPED_NINETY = :flipped_ninety
    FLIPPED_ONE_EIGHTY = :flipped_one_eighty
    FLIPPED_TWO_SEVENTY = :flipped_two_seventy

    def self.all
      constants.map { |c| const_get(c) }
    end
  end
end

require 'bloqus/coordinates'
require 'bloqus/cell_collection'
require 'bloqus/board'
require 'bloqus/game'
require 'bloqus/piece'
require 'bloqus/piece_placement'
require 'bloqus/rotated_piece'
require 'bloqus/version'
