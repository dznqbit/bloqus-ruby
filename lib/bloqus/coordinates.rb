module Bloqus
  Coordinates = Struct.new(:x, :y) do
    def self.zero
      @zero ||= new(0, 0).freeze
    end

    def to_s
      "(#{x},#{y})"
    end

    def to_a
      [x, y]
    end

    def inspect
      to_s
    end
  end

  # VertexCoordinates and CellCoordinates are offset by +0.5.
  # That means that the Cell at (0,0) is bound by Vertices (0,0),(1,0),(1,1),(0,1)
  # This is all written assuming screen coordinate system, ie (0,0) is upper left corner.

  CellCoordinates = Class.new(Coordinates) do
    # Clockwise, starting with upper left.
    def vertex_coordinates
      [[0, 0], [1, 0], [1, 1], [0, 1]].map { |vx, vy| VertexCoordinates.new(x + vx, y + vy) }
    end

    def to_s
      "C#{super}"
    end
  end

  VertexCoordinates = Class.new(Coordinates) do
    # Clockwise, starting with lower right.
    def cell_coordinates
      [[0, 0], [-1, 0], [-1, -1], [0, -1]].map { |cx, cy| CellCoordinates.new(x + cx, y + cy) }
    end

    def to_s
      "V#{super}"
    end
  end
end
