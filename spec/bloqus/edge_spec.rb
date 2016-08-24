require 'spec_helper'

describe Bloqus::Edge do
  let(:cells) { simple_cells }
  let(:cell_collection) { Bloqus::CellCollection.new(cells) }
  let(:edge) { cell_collection.edge(vc1, vc2) }

  describe '#new' do
    it 'should raise private method' do
      expect { described_class.new }.to raise_error(ArgumentError)
    end
  end

  describe '#valid?' do
    subject { edge.valid? }

    context 'invalid edge' do
      let(:vc1) { vc(2, 2) }
      let(:vc2) { vc(1, 2) }

      it { should be false }
    end

    context 'valid edge' do
      let(:vc1) { vc(0, 0) }
      let(:vc2) { vc(1, 0) }

      it { should be true }
    end
  end

  describe '#rh_cell' do
    subject { edge.rh_cell }

    context 'clockwise' do
      let(:vc1) { vc(1, 1) }
      let(:vc2) { vc(2, 1) }

      its(:filled?) { should be false }
      its(:coordinates) { should eq cc(1, 1) }
    end

    context 'counterclockwise' do
      let(:vc1) { vc(2, 1) }
      let(:vc2) { vc(1, 1) }

      its(:filled?) { should be true }
      its(:coordinates) { should eq cc(1, 0) }
    end
  end

  describe '#lh_cell' do
    subject { edge.lh_cell }

    context 'clockwise' do
      let(:vc1) { vc(1, 1) }
      let(:vc2) { vc(2, 1) }

      its(:filled?) { should be true }
      its(:coordinates) { should eq cc(1, 0) }
    end

    context 'counterclockwise' do
      let(:vc1) { vc(2, 1) }
      let(:vc2) { vc(1, 1) }

      its(:filled?) { should be false }
      its(:coordinates) { should eq cc(1, 1) }
    end
  end

  describe '#clockwise?' do
    subject { edge.clockwise? }

    context 'clockwise' do
      let(:vc1) { vc(1, 1) }
      let(:vc2) { vc(1, 2) }

      it { should be true }
    end

    context 'counterclockwise' do
      let(:vc1) { vc(1, 1) }
      let(:vc2) { vc(2, 1) }

      it { should be false }
    end

    context 'invalid' do
      let(:vc1) { vc(1, 2) }
      let(:vc2) { vc(2, 2) }

      it { should be false }
    end
  end
end
