module Bloqus
  class RotatedPiece
    extend Forwardable

    attr_reader :rotation

    def_delegators :@rotated_piece, :to_s, :cells

    def initialize(piece:, rotation:)
      @piece = piece
      @rotation = rotation
      @rotated_piece = Piece.new(build_cells)
    end

    private

    attr_reader :piece

    def build_cells
      cells = piece.cells

      case rotation
      when Rotations::NINETY               then rotate(cells)
      when Rotations::ONE_EIGHTY           then flip_y(flip_x(cells))
      when Rotations::TWO_SEVENTY          then cells.transpose.reverse
      when Rotations::FLIPPED_ZERO         then flip_y(cells)
      when Rotations::FLIPPED_NINETY       then rotate(flip_y(cells))
      when Rotations::FLIPPED_ONE_EIGHTY   then flip_x(cells)
      when Rotations::FLIPPED_TWO_SEVENTY  then rotate(flip_x(cells))
      else                                      cells
      end
    end

    # Mirror image along y axis
    def flip_y(cells)
      cells.map(&:reverse)
    end

    # Mirror image along x axis
    def flip_x(cells)
      cells.reverse
    end

    # Rotated clockwise by 90º
    def rotate(cells)
      cells.transpose.map(&:reverse)
    end
  end
end
