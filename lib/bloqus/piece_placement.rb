require 'bloqus/text_cell_presenter'

module Bloqus
  # Represents a placed piece.
  class PiecePlacement
    attr_reader :coordinates
    attr_reader :rotated_piece
    attr_reader :color

    def initialize(color:, rotated_piece:, coordinates:)
      @color = color
      @rotated_piece = rotated_piece
      @coordinates = coordinates
    end

    def cells
      rotated_piece.cells.map do |row|
        row.map { |cell| cell ? color : false }
      end
    end

    # Ignores coordinate.
    def to_s
      TextCellPresenter.new(cells: cells).to_s
    end
  end
end
