module Bloqus
  # Defines the shape of a piece.
  class Piece
    # Array(Array(true/false))
    attr_reader :cells

    # Loads a Piece database.
    # @param file [String] database file path
    # @return [Array(Piece)] Pieces from *file*
    def self.load(file)
      db = File.read(file)
      lines = db.split("\n").
        # Trim comments
        map { |s| s.gsub(/#.*/, '') }.

        # "Split" by blank Lines
        chunk_while { |i, j| i =~ /\S/ && j =~ /\S/ }.

        # Remove blank lines
        reject { |i| i.length == 1 && i[0].blank? }.

        # Flatten
        map { |a| a.join("\n") }.

        # Map to Pieces
        map { |s| from_s(s) }
    end

    # Builds a Piece from a string.
    # @param s [String] a String representing the Piece. Use `' '` to indicate whitespace, `'.'` to
    #   indicate filled space, and `"\n"` to indicate a new row
    # @return [Piece] Piece represented by *s*
    def self.from_s(s)
      cells = s.
        split("\n").
        map do |row|
          row.split('').map { |c| !c.blank? }
        end

      new(cells)
    end

    # Initializes a Piece.
    # @param cells [Array] an Array of Arrays describing the shape of the piece.
    def initialize(cells)
      cell_width = cells.map(&:length).max

      @cells = cells.map do |row|
        Array.new(cell_width) { |i| row[i] ? true : false }
      end.
      freeze
    end

    def to_s
      cells.map { |row| row.map { |c| c ? '.' : ' ' }.join('') }.join("\n")
    end

    def width
      cells.first.length
    end

    def height
      cells.length
    end
  end
end
