module Bloqus
  # Helper module defining directions in clockwise.
  module Directions
    RIGHT = [1, 0]
    DOWN = [0, 1]
    LEFT = [-1, 0]
    UP = [0, -1]

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
  end
end
