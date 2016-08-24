module Bloqus
  # Cell represents a Cell in a grid. Accessible through CellCollection.
  class Cell
    # @param cell_collection [CellCollection] the CellCollection
    # @param coordinates [Coordinates] coordinates of the Cell
    # @param value [Object] value of the Cell
    def self.cc_new(cell_collection:, coordinates:, value:)
      obj = allocate
      obj.send(
        :initialize,
        cell_collection: cell_collection,
        coordinates: coordinates,
        value: value
      )
      obj
    end

    def filled?
      value ? true : false
    end

    protected

    attr_reader :cell_collection, :coordinates, :value

    def self.new
      raise ArgumentError.new("Please access #{self.class.name} through CellCollection")
    end

    # @param cell_collection [CellCollection] the CellCollection
    def initialize(cell_collection:, coordinates:, value:)
      @cell_collection = cell_collection
      @coordinates = coordinates
      @value = value
    end
  end
end
