require 'bloqus/cell'
require 'bloqus/edge'
require 'bloqus/vertex'

module Bloqus
  # CellCollection allows traversal over a grid.
  class CellCollection
    # @param data [Array] an Array of Arrays describing the collection.
    def initialize(data)
      max_width = data.map(&:length).max

      @grid = data.map.with_index do |row, y|
        Array.new(max_width) { |x| row[x] }
      end
    end

    def to_a
      grid.map do |row|
        row.map(&:itself)
      end
    end

    def edge(vc1, vc2)
      unless [vc1, vc2].all? { |v| v.is_a?(Coordinates) }
        raise ArgumentError.new("coordinates cannot be a #{coordinates.class}")
      end

      Bloqus::Edge.cc_new(cell_collection: self, v1: vertex(vc1), v2: vertex(vc2))
    end

    def vertex(coordinates)
      unless coordinates.is_a?(Coordinates)
        raise ArgumentError.new("coordinates cannot be a #{coordinates.class}")
      end

      Bloqus::Vertex.cc_new(cell_collection: self, coordinates: coordinates)
    end

    def cell(coordinates)
      unless coordinates.is_a?(Coordinates)
        raise ArgumentError.new("coordinates cannot be a #{coordinates.class}")
      end

      # We cannot naively allow any coordinates, because negative coordinates improperly
      # address the "rear end" of a ruby array.
      value = if (0...height).include?(coordinates.y) && (0...width).include?(coordinates.x)
        grid[coordinates.y][coordinates.x]
      end

      Bloqus::Cell.cc_new(
        cell_collection: self,
        coordinates: coordinates,
        value: value
      )
    end

    def width
      @grid.first.length
    end

    def height
      @grid.length
    end

    private

    attr_reader :grid
  end
end
