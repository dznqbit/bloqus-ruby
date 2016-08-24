module Bloqus
  # Helper module defining directions in clockwise.
  module Directions
    RIGHT = [1, 0]
    DOWN = [0, 1]
    LEFT = [-1, 0]
    UP = [0, -1]

    LOWER_RIGHT = [1, 1]
    LOWER_LEFT  = [-1, 1]
    UPPER_LEFT  = [-1, -1]
    UPPER_RIGHT = [1, -1]

    def all_directions
      clockwise_directions
    end

    def clockwise_directions
      [RIGHT, DOWN, LEFT, UP]
    end

    def counterclockwise_directions
      [RIGHT, UP, LEFT, DOWN]
    end

    def right; RIGHT; end
    def down; DOWN; end
    def left; LEFT; end
    def up; UP; end

    def lower_right; LOWER_RIGHT; end
    def lower_left; LOWER_LEFT; end
    def upper_left; UPPER_LEFT; end
    def upper_right; UPPER_RIGHT; end
  end
end
