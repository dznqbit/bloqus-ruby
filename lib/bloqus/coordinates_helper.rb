require 'bloqus/coordinates'
require 'bloqus/vertex_coordinates'

module Bloqus
  module CoordinatesHelper
    protected

    def cc(x, y)
      CellCoordinates.new(x, y)
    end

    def vc(x, y)
      VertexCoordinates.new(x, y)
    end
  end
end
