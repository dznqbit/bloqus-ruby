require 'spec_helper'

describe Bloqus::VertexCoordinates do
  let(:x) { rand(20) + 1 }
  let(:y) { rand(20) + 1 }

  let(:vertex_coordinate) { described_class.new(x, y) }

  describe '#cell_coordinates' do
    subject { vertex_coordinate.cell_coordinates }

    it 'should return correct array' do
      expect(subject).to eq([
        Bloqus::CellCoordinates.new(x, y),
        Bloqus::CellCoordinates.new(x - 1, y),
        Bloqus::CellCoordinates.new(x - 1, y - 1),
        Bloqus::CellCoordinates.new(x, y - 1),
      ])
    end
  end
end
