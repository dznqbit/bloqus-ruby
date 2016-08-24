require 'bloqus/directions'

module Bloqus
  # Edge represents an edge between two verticies.
  class Edge
    include Bloqus::Directions

    # @param cell_collection [CellCollection] the CellCollection
    # @param v1 [Vertex] the origin Vertex of the edge
    # @param v2 [Vertex] the destination Vertex of the edge
    def self.cc_new(cell_collection:, v1:, v2:)
      obj = allocate
      obj.send(:initialize, cell_collection: @cell_collection, v1: v1, v2: v2)
      obj
    end

    # Returns +true+ if the edge runs along the edge of a filled Cell.
    def valid?
      cells.find_all(&:filled?).compact.length == 1
    end

    # Returns +true+ if the edge runs clockwise along the filled Cell.
    def clockwise?
      rh_cell.filled? && !lh_cell.filled?
    end

    # Returns the Cell to the right of the edge.
    def rh_cell
      v1.cells[clockwise_directions.index(direction)]
    end

    # Returns the Cell to the left of the edge.
    def lh_cell
      v1.cells[(clockwise_directions.index(direction) + 3) % 4]
    end

    def origin
      v1
    end

    def terminus
      v2
    end

    def to_s
      "E #{v1.inspect}-#{v2.inspect}"
    end

    def inspect
      to_s
    end

    def ==(rhs)
      v1 == rhs.send(:v1) &&
      v2 == rhs.send(:v2) &&
      cell_collection == rhs.send(:cell_collection)
    end

    def direction
      [v2.x - v1.x, v2.y - v1.y]
    end

    private

    attr_reader :cell_collection, :v1, :v2

    def self.new(cell_collection:, v1:, v2:)
      raise ArgumentError.new("Please access #{self.class.name} through CellCollection")
    end

    # @param cell_collection [CellCollection] the CellCollection
    # @param v1 [Vertex] the origin Vertex of the edge
    # @param v2 [Vertex] the destination Vertex of the edge
    def initialize(cell_collection:, v1:, v2:)
      @cell_collection = cell_collection
      @v1 = v1
      @v2 = v2

      unless all_directions.include?(direction)
        raise ArgumentError.new("Invalid interval #{direction}")
      end
    end

    def cells
      [rh_cell, lh_cell]
    end
  end
end
