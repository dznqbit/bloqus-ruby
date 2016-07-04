require 'bloqus'

include Bloqus

pieces = Piece.load('data/pieces.txt')

board_width = 20
board_height = 20
colors = Colors.all.cycle

begin
  piece_placements = 10.times.map do
    color = colors.next
    piece = pieces.sample
    rotation = Rotations.all.sample
    rotated_piece = RotatedPiece.new(piece: piece, rotation: rotation)
    coordinates = Coordinates.new(
      rand(board_width - rotated_piece.width),
      rand(board_height - rotated_piece.height)
    )

    PiecePlacement.new(color: color, rotated_piece: rotated_piece, coordinates: coordinates)
  end

  board = Board.new(piece_placements: piece_placements)
rescue Board::InvalidPlacementError
  retry
end


presenter = TextCellPresenter.new(cells: board.cells, border: true)

puts presenter.to_s
