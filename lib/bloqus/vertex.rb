module Bloqus
  # Vertex provides traversal operations over verticies in a CellCollection.
  class Vertex
    extend Forwardable
    include Directions

    attr_reader :coordinates

    # @param cell_collection [CellCollection] the CellCollection
    # @param coordinates [Coordinates] the coordinates of the Vertex
    def self.cc_new(cell_collection:, coordinates:)
      obj = allocate
      obj.send(:initialize, cell_collection: cell_collection, coordinates: coordinates)
      obj
    end

    def corner?
      counted_hash = cells.
        map(&:filled?).
        group_by(&:itself)

      three_values = counted_hash.values.any? { |v| [1, 3].include?(v.length) }
      at_least_one_filled = counted_hash.keys.find(&:itself)

      three_values && at_least_one_filled
    end

    # Returns all adjacent edges.
    def edges
      neighbor_verticies.map { |vertex| edge(coordinates, vertex.coordinates) }
    end

    # Returns all adjacent cells.
    def cells
      coordinates.
        cell_coordinates.
        map { |cc| cell(cc) }
    end

    def ==(rhs)
      coordinates == rhs.send(:coordinates) &&
      cell_collection == rhs.send(:cell_collection)
    end

    def to_s
      "@#{coordinates}"
    end

    def inspect
      to_s
    end

    private

    def self.new(cell_collection:, coordinates:)
      raise ArgumentError.new("Please access #{self.class.name} through CellCollection")
    end

    def initialize(cell_collection:, coordinates:)
      @coordinates = VertexCoordinates.new(coordinates.x, coordinates.y)
      @cell_collection = cell_collection
    end

    def neighbor_verticies
      coordinates.neighbors.lazy.map { |nc| vertex(nc) }
    end

    attr_reader :cell_collection

    def_delegators :cell_collection, :cell, :edge, :vertex
    def_delegators :coordinates, :cell_coordinates, :x, :y
  end
end
