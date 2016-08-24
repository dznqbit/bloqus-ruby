module Bloqus
  CellCoordinates = Class.new(Coordinates) do
    # Clockwise, starting with upper left.
    def vertex_coordinates
      [[0, 0], [1, 0], [1, 1], [0, 1]].map { |vx, vy| VertexCoordinates.new(x + vx, y + vy) }
    end

    def to_s
      "C#{super}"
    end
  end
end
