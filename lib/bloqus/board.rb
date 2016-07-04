require 'bloqus/text_cell_presenter'

module Bloqus
  # A board and piece placements.
  class Board
    attr_reader :cells

    def initialize(piece_placements: [], width: 20, height: 20)
      @piece_placements = piece_placements
      @cells = build_cells(width, height, piece_placements)
    end

    def to_s
      TextCellPresenter.new(cells: cells).to_s
    end

    InvalidPlacementError = Class.new(StandardError)

    OutOfBoundsError = Class.new(InvalidPlacementError)
    DoubleAssignmentError = Class.new(InvalidPlacementError)

    private

    def build_cells(width, height, piece_placements)
      cells = Array.new(height) { Array.new(width, false) }

      piece_placements.each do |piece_placement|
        piece_cells = piece_placement.cells
        piece_cells.each_with_index do |piece_cell_row, y|
          row_y = piece_placement.coordinates.y + y
          raise OutOfBoundsError if row_y >= height

          piece_cell_row.each_with_index do |piece_cell, x|
            # Ignore writing blank space.
            next unless piece_cell

            cell_x = piece_placement.coordinates.x + x
            raise OutOfBoundsError if cell_x >= width

            raise DoubleAssignmentError if cells[row_y][cell_x]

            cells[row_y][cell_x] = piece_cell
          end
        end
      end

      cells
    end
  end
end
