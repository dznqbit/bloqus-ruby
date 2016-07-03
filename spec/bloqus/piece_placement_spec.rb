require 'spec_helper'

describe Bloqus::PiecePlacement do
  let(:piece) { Bloqus::Piece.from_s("...\n.") }
  let(:rotation) { Bloqus::Rotations::ZERO }
  let(:color) { Bloqus::Colors::GREEN }
  let(:coordinate) { Bloqus::Coordinate.new(0, 0) }

  let(:rotated_piece) { Bloqus::RotatedPiece.new(piece: piece, rotation: rotation) }

  let(:piece_placement) do
    described_class.new(coordinate: coordinate, color: color, rotated_piece: rotated_piece)
  end

  describe '#to_s' do
    subject { piece_placement.to_s }

    it 'places color' do
      expect(subject).to eq("ggg\ng  ")
    end

    context 'with rotation applied' do
      subject { piece_placement.to_s }
      let(:rotation) { Bloqus::Rotations::NINETY }

      it 'rotates' do
        expect(subject).to eq("gg\n g\n g")
      end
    end
  end

  describe '#cells' do
    subject { piece_placement.cells }

    it 'subsitutes color for true' do
      expect(subject).to eq([[color, color, color], [color, false, false]])
    end
  end
end
