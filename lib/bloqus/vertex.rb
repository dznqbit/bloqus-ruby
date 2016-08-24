module Bloqus
  # Vertex provides traversal operations over verticies in a CellCollection.
  class Vertex
    extend Forwardable

    def_delegators :coordinates, :x, :y

    def initialize(cell_collection:, coordinates:)
      @coordinates = coordinates
      @cell_collection = cell_collection
    end

    def corner?
      counted_hash = cells.
        map(&:filled?).
        group_by(&:itself)

      three_values = counted_hash.values.any? { |v| [1, 3].include?(v.length) }
      at_least_one_filled = counted_hash.keys.compact.first

      three_values && at_least_one_filled
    end

    # Next clockwise vertex
    def next
      if cells.count(&:filled?) == 3
        edges.last
      else
        edges.first
      end
    end

    def edges
      coordinates.neighbors.find_all do |vc|
        common_cells(vc).count(&:filled?) == 1
      end
    end

    def common_cells(other)
      coordinates.common_cell_coordinates(other).map { |cc| cell(cc) }
    end

    def cells
      coordinates.
        cell_coordinates.
        map { |cc| cell(cc) }
    end

    private

    attr_reader :cell_collection, :coordinates

    def_delegator :cell_collection, :cell

  end
end
