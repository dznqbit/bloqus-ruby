require 'spec_helper'

describe Bloqus::CellCoordinates do
  let(:x) { rand(20) + 1 }
  let(:y) { rand(20) + 1 }

  let(:cell_coordinate) { described_class.new(x, y) }

  describe '#vertex_coordinates' do
    subject { cell_coordinate.vertex_coordinates }

    it 'should return correct array' do
      expect(subject).to eq([
        Bloqus::VertexCoordinates.new(x, y),
        Bloqus::VertexCoordinates.new(x + 1, y),
        Bloqus::VertexCoordinates.new(x + 1, y + 1),
        Bloqus::VertexCoordinates.new(x, y + 1),
      ])
    end
  end
end
