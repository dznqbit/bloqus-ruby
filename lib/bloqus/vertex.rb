module Bloqus
  # Vertex provides traversal operations over verticies in a CellCollection.
  class Vertex
    extend Forwardable

    # @param cell_collection [CellCollection] the CellCollection
    # @param coordinates [Coordinates] the coordinates of the Vertex
    def self.cc_new(cell_collection:, coordinates:)
      obj = allocate
      obj.send(:initialize, cell_collection: @cell_collection, coordinates: coordinates)
      obj
    end

    def corner?
      counted_hash = cells.
        map(&:filled?).
        group_by(&:itself)

      three_values = counted_hash.values.any? { |v| [1, 3].include?(v.length) }
      at_least_one_filled = counted_hash.keys.compact.first

      three_values && at_least_one_filled
    end

    # Returns all adjacent edges.
    def edges
      all_edges = clockwise_directions.map do |direction|
        neighbor_vc = VertexCoordinate.new(*direction)
        neighbor_v = vertex(neighbor_vc)
        edge = edge(self, neighbor_v)
      end
    end

    # Returns all adjacent cells.
    def cells
      coordinates.
        cell_coordinates.
        map { |cc| cell(cc) }
    end

    private

    def self.new(cell_collection:, coordinates:)
      raise ArgumentError.new("Please access #{self.class.name} through CellCollection")
    end

    def initialize(cell_collection:, coordinates:)
      @coordinates = coordinates
      @cell_collection = cell_collection
    end

    attr_reader :cell_collection, :coordinates

    def_delegators :cell_collection, :cell, :edge, :vertex
  end
end
