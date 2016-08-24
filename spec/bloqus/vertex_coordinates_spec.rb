require 'spec_helper'
require 'bloqus/coordinates'

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

  describe '#common_cell_coordinates' do
    subject { vertex_coordinates.common_cell_coordinates(other) }
    let(:other) { described_class.new(*oc) }

    context 'far away x' do
      let(:oc) { [x + 10, y] }
      it { should be_empty }
    end

    context 'far away y' do
      let(:oc) { [x, y + 10] }
      it { should be_empty }
    end

    context 'close by neighbor 1' do
      let(:oc) { [x + 1, y] }
      it { should eq([cc(x, y - 1), cc(x, y)]) }
    end

    context 'close by neighbor 2' do
      let(:oc) { [x, y + 1] }
      it { should eq([cc(x, y), cc(x - 1, y)]) }
    end

    context 'close by neighbor 3' do
      let(:oc) { [x - 1, y] }
      it { should eq([cc(x - 1, y), cc(x - 1, y - 1)]) }
    end

    context 'close by neighbor 4' do
      let(:oc) { [x, y - 1] }
      it { should eq([cc(x - 1, y - 1), cc(x, y - 1)]) }
    end

    context 'close by diagonal 1' do
      let(:oc) { [x + 1, y + 1] }
      it { should eq([cc(x, y)]) }
    end

    context 'close by diagonal 2' do
      let(:oc) { [x - 1, y + 1] }
      it { should eq([cc(x - 1, y)]) }
    end

    context 'close by diagonal 3' do
      let(:oc) { [x - 1, y - 1] }
      it { should eq([cc(x - 1, y - 1)]) }
    end

    context 'close by diagonal 4' do
      let(:oc) { [x + 1, y - 1] }
      it { should eq([cc(x, y - 1)]) }
    end
  end
end
