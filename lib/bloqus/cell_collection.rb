require 'bloqus/cell'

module Bloqus
  class CellCollection
    # @param cells [Array] an Array of Arrays describing the collection.
    def initialize(cells_a)
      cell_width = cells_a.map(&:length).max
      cells = cells_a.map.with_index do |row, y|
        Array.new(cell_width) do |x|
          coordinates = CellCoordinates.new(x, y)
          value = row[x].freeze

          Cell.new(coordinates, value)
        end
      end

      @rows = cells
    end

    def to_s(&display_block)
      rows.map do |row|
        row.map do |c|
          if block_given?
            yield c.value
          else
            c.filled?? '.' : ' '
          end
        end.join('')
      end.join("\n")
    end

    def to_a
      rows.map do |row|
        row.map(&:value)
      end
    end

    def vertex(coordinates)
    end

    def cell(coordinates)
      rows[coordinates.y][coordinates.x]
    end

    def find_all(&blk)
      rows.flat_map do |row|
        row.find_all(&blk)
      end
    end

    private

    attr_reader :rows
  end
end
