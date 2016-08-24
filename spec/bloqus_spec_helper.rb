require 'bloqus/vertex_coordinates'
require 'bloqus/directions'
require 'bloqus/cell_collection'

module BloqusSpecHelper
  extend Forwardable
  include Bloqus::Directions

  # Returns a shape like
  # ***
  # *
  def simple_cells
    [[true, true, true], [true]]
  end

  def simple_cell_collection
    Bloqus::CellCollection.new(simple_cells)
  end

  # Returns a shape like
  #  *
  # ***
  #  *
  def cross_cells
    [[false, true, false], [true, true, true], [false, true, false]]
  end

  # Returns a shape like
  # **
  # **
  def box_cells
    [[true, true], [true, true]]
  end

  def cells_to_s(cells)
    Bloqus::TextCellPresenter.new(cells: cells).to_s
  end

  protected

  # Convenience vertex coordinates
  def vc(x, y)
    Bloqus::VertexCoordinates.new(x, y)
  end

  # Convenience cell coordinates
  def cc(x, y)
    Bloqus::CellCoordinates.new(x,y )
  end
end
