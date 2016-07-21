module Bloqus
  Cell = Struct.new(:coordinates, :value) do
    extend Forwardable

    def_delegator :@coordinates, :corners
    def_delegator :cell_coordinates, :vertex_coordinates

    def filled?
      true if value
    end

    private

    def cell_coordinates
      CellCoordinates.new(coordinates.x, coordinates.y)
    end
  end
end
