require 'bloqus/coordinates_helper'
require 'bloqus/cell_collection'

module Bloqus
  class CornerFinder
    extend Forwardable
    include CoordinatesHelper

    def initialize(cell_collection)
      @cell_collection = cell_collection
    end

    # Starting from top-left + clockwise.
    def corners
      unless @corners
        @corners = [first_corner]

        ((cell_collection.width+1) * (cell_collection.height+1)).times do |i|
          next_corner = next_clockwise_vertex(@corners.last)

          if @corners.include?(next_corner)
            break
          else
            @corners << next_corner
          end
        end
      end

      @corners
    end

    def first_corner
      (0...cell_collection.width).
        lazy.
        map { |x| vertex(vc(x, 0)) }.
        find(&:corner?)
    end

    def next_clockwise_vertex(vertex)
      clockwise_edge = vertex.edges.find(&:clockwise?)
      next_v = clockwise_edge.terminus
      direction = clockwise_edge.direction

      cell_collection.width.times do
        return next_v if next_v.corner?

        current_coords = next_v.coordinates
        new_coords = Coordinates.new(
          current_coords.x + direction[0],
          current_coords.y + direction[1]
        )

        next_v = vertex(new_coords)
      end

      nil
    end

    private

    attr_reader :cell_collection

    def_delegators :cell_collection, :cell, :edge, :vertex

    def all_corners
      @all_corners ||= filled_cells.map do |cell|
        cell.vertex_coordinates.find_all do |vc|
          cell_collection.vertex(vc).corner?
        end
      end.
      flatten.
      uniq.
      compact
    end

    def filled_cells
      cell_collection.find_all(&:filled?)
    end
  end
end
