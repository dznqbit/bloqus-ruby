require 'spec_helper'

describe Bloqus::Board do
  let(:width)   { 5 }
  let(:height)  { 5 }

  let(:green) { Bloqus::Colors::GREEN }
  let(:red) { Bloqus::Colors::RED }

  let(:piece) { Bloqus::Piece.from_s("...\n.") }

  let(:board) {
    described_class.new(width: width, height: height, piece_placements: piece_placements)
  }

  let(:piece_placement_1) {
    Bloqus::PiecePlacement.new(
      color: green,
      rotated_piece: Bloqus::RotatedPiece.new(piece: piece, rotation: Bloqus::Rotations::ONE_EIGHTY),
      coordinates: Bloqus::Coordinates.new(1, 1)
    )
  }

  let(:piece_placement_2) {
    Bloqus::PiecePlacement.new(
      color: red,
      rotated_piece: Bloqus::RotatedPiece.new(piece: piece, rotation: Bloqus::Rotations::FLIPPED_NINETY),
      coordinates: Bloqus::Coordinates.new(3, 2)
    )
  }

  describe '::new' do
    subject { board }

    context 'with valid placements' do
      let(:piece_placements) { [piece_placement_1, piece_placement_2] }

      it 'should work' do
        expect { subject }.to_not raise_error
      end
    end

    context 'with invalid placements' do
      let(:piece_placements) { [piece_placement_1, bad_piece_placement] }

      context '- out-of-bounds' do
        let(:bad_piece_placement) {
          Bloqus::PiecePlacement.new(
            color: green,
            rotated_piece: Bloqus::RotatedPiece.new(piece: piece, rotation: Bloqus::Rotations::ZERO),
            coordinates: Bloqus::Coordinates.new(4,1)
          )
        }

        it 'should raise OutOfBoundsError' do
          expect { subject }.to raise_error(Bloqus::Board::OutOfBoundsError)
        end
      end

      context '- overwriting ' do
        let(:bad_piece_placement) {
          Bloqus::PiecePlacement.new(
            color: green,
            rotated_piece: Bloqus::RotatedPiece.new(piece: piece, rotation: Bloqus::Rotations::ZERO),
            coordinates: Bloqus::Coordinates.new(1,1)
          )
        }

        it 'should raise DoubleAssignmentError' do
          expect { subject }.to raise_error(Bloqus::Board::DoubleAssignmentError)
        end
      end
    end
  end

  describe '#to_s' do
    subject { board.to_s }

    context 'with no piece placements' do
      let(:piece_placements) { [] }

      it 'should be an empty board' do
        empty_line = " " * width
        empty_str = Array.new(height, empty_line).join("\n")

        expect(subject).to eq(empty_str)
      end
    end

    context 'with some piece placements' do
      let(:piece_placements) { [piece_placement_1, piece_placement_2] }

      it 'should place the pieces accordingly' do
        board_str = [
          '     ',
          '   g ',
          ' gggr',
          '    r',
          '   rr'
        ].join("\n")

        expect(subject).to eq(board_str)
      end
    end
  end
end
