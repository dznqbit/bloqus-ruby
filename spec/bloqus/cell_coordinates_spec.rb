require 'spec_helper'
require 'bloqus/coordinates'

describe Bloqus::CellCoordinates do
  let(:x) { rand(20) + 1 }
  let(:y) { rand(20) + 1 }

  let(:cell_coordinates) { described_class.new(x, y) }
  subject { cell_coordinates }

  describe '#vertex_coordinates' do
    subject { cell_coordinates.vertex_coordinates }

    it 'should return correct array' do
      expect(subject).to eq([
        Bloqus::VertexCoordinates.new(x, y),
        Bloqus::VertexCoordinates.new(x + 1, y),
        Bloqus::VertexCoordinates.new(x + 1, y + 1),
        Bloqus::VertexCoordinates.new(x, y + 1),
      ])
    end
  end

  describe '#neighbors' do
    it 'should return described class' do
      expect(subject.neighbors.first).to be_a(described_class)
    end
  end
end
