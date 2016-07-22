require 'spec_helper'

describe Bloqus::VertexCoordinates do
  let(:x) { rand(20) + 1 }
  let(:y) { rand(20) + 1 }

  let(:vertex_coordinates) { described_class.new(x, y) }
  subject { vertex_coordinates }

  describe '#cell_coordinates' do
    subject { vertex_coordinates.cell_coordinates }

    it 'should return correct array' do
      expect(subject).to eq([
        cc(x, y),
        cc(x - 1, y),
        cc(x - 1, y - 1),
        cc(x, y - 1),
      ])
    end
  end

  describe '#neighbors' do
    it 'should return described class' do
      expect(subject.neighbors.first).to be_a(described_class)
    end
  end
end
