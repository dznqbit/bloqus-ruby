require 'bloqus/coordinates'

module Bloqus
  VertexCoordinates = Class.new(Coordinates) do
    # Clockwise, starting with lower right.
    def cell_coordinates
      [[0, 0], [-1, 0], [-1, -1], [0, -1]].map { |dx, dy| CellCoordinates.new(x + dx, y + dy) }
    end

    def common_cell_coordinates(other)
      dx, dy = other.x - x, other.y - y

      case [dx, dy]
      # 'neighbor' vertices.
      # Cells are ordered [counterclockwise, clockwise] with respect to the connecting edge
      when [1, 0]   then [cc(x, y - 1), cc(x, y)]
      when [0, 1]   then [cc(x, y), cc(x - 1, y)]
      when [-1, 0]  then [cc(x - 1, y), cc(x - 1, y - 1)]
      when [0, -1]  then [cc(x - 1, y - 1), cc(x, y - 1)]

      else
        if dx.abs == 1 && dy.abs == 1
          # Diagonal.
          [cc(x + [dx, 0].min, y + [dy, 0].min)]
        else
          # Out of bounds.
          []
        end
      end
    end

    def to_s
      "V#{super}"
    end

    private

    def cc(x, y)
      CellCoordinates.new(x, y)
    end
  end
end
