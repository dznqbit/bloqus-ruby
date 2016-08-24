require 'bloqus/coordinates'
require 'bloqus/coordinates_helper'

require 'bloqus/directions'
require 'bloqus/cell_collection'

module BloqusSpecHelper
  extend Forwardable
  include Bloqus::Directions
  include Bloqus::CoordinatesHelper

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
end
