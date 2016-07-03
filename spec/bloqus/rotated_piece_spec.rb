require 'spec_helper'

describe Bloqus::RotatedPiece do
  let(:piece) { Bloqus::Piece.from_s("...\n.") }
  let(:rotated_piece) { described_class.new(piece: piece, rotation: rotation) }

  subject { rotated_piece }

  context 'rotation ZERO' do
    let(:rotation) { Bloqus::Rotations::ZERO }
    its(:to_s) { should eq("...\n.  ") }
  end

  context 'rotation NINETY' do
    let(:rotation) { Bloqus::Rotations::NINETY }
    its(:to_s) { should eq("..\n .\n .") }
  end

  context 'rotation ONE_EIGHTY' do
    let(:rotation) { Bloqus::Rotations::ONE_EIGHTY }
    its(:to_s) { should eq("  .\n...") }
  end

  context 'rotation TWO_SEVENTY' do
    let(:rotation) { Bloqus::Rotations::TWO_SEVENTY }
    its(:to_s) { should eq(". \n. \n..") }
  end

  context 'rotation FLIPPED_ZERO' do
    let(:rotation) { Bloqus::Rotations::FLIPPED_ZERO }
    its(:to_s) { should eq("...\n  .") }
  end

  context 'rotation FLIPPED_NINETY' do
    let(:rotation) { Bloqus::Rotations::FLIPPED_NINETY }
    its(:to_s) { should eq(" .\n .\n..") }
  end

  context 'rotation FLIPPED_ONE_EIGHTY' do
    let(:rotation) { Bloqus::Rotations::FLIPPED_ONE_EIGHTY }
    its(:to_s) { should eq(".  \n...") }
  end

  context 'rotation TWO_SEVENTY' do
    let(:rotation) { Bloqus::Rotations::FLIPPED_TWO_SEVENTY }
    its(:to_s) { should eq("..\n. \n. ") }
  end
end
