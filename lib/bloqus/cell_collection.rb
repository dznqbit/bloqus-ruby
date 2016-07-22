require 'bloqus/cell'

module Bloqus
  # Rough representation of a Cell grid.
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

    # def vertex(coordinates)
    # end

    def cell(coordinates)
      x, y = coordinates.to_a

      if (0...width).include?(x) && (0...height).include?(y)
        rows[coordinates.y].fetch(coordinates.x)
      else
        Bloqus::Cell.null(coordinates)
      end
    end

    def find_all(&blk)
      rows.flat_map do |row|
        row.find_all(&blk)
      end
    end

    # Returns a flat map of Cells.
    def map(&blk)
      rows.flat_map { |row| row.map(&blk) }
    end

    private

    attr_reader :rows

    def width
      @rows.first.length
    end

    def height
      @rows.length
    end
  end
end
