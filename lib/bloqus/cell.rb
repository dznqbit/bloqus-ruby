module Bloqus
  Cell = Struct.new(:coordinates, :value) do
    def self.null(coordinates)
      new(coordinates, nil)
    end

    extend Forwardable

    def_delegator :@coordinates, :corners
    def_delegator :cell_coordinates, :vertex_coordinates

    def filled?
      true if value
    end

    def to_s
      "(#{coordinates}: #{value.inspect})"
    end

    def inspect; to_s; end

    private

    def cell_coordinates
      CellCoordinates.new(coordinates.x, coordinates.y)
    end
  end
end
