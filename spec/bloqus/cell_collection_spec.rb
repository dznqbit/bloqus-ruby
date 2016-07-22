require 'spec_helper'
require 'bloqus/cell_collection'

describe Bloqus::CellCollection do
  subject { cell_collection }

  let(:cell_collection) { described_class.new(cells) }

  describe '::new' do
    context 'one row is shorter than the others' do
      let(:cells) { [[true, true, true], [true]] }

      it 'should unify length of all rows' do
        expect(subject.to_a).to eq([[true, true, true], [true, nil, nil]])
      end
    end
  end

  describe '#cell' do
    let(:cells) { [[true, true, true], [true]] }
    subject { cell_collection.cell(coordinate) }

    context 'coordinate inside collection space' do
      let(:coordinate) { Bloqus::Coordinates.new(0, 0) }
      it { expect(subject.filled?).to be true }
    end

    context 'coordinate outside collection space' do
      context 'too big' do
        let(:coordinate) { Bloqus::Coordinates.new(5, 0) }
        it { expect(subject.filled?).to be_falsey }
      end

      context 'too small' do
        let(:coordinate) { Bloqus::Coordinates.new(-1, 0) }
        it { expect(subject.filled?).to be_falsey }
      end
    end
  end

  describe '#find_all' do
    let(:cells) { simple_cells }

    it 'should return all cells' do
      expect(subject.find_all(&:filled?).length).to eq(4)
    end
  end

  describe '#to_s' do
    let(:cells) { [[:a, :a, :b], [:c]] }

    context 'without block' do
      subject { cell_collection.to_s }

      it 'should use dots and spaces' do
        expect(subject).to eq("...\n.  ")
      end
    end

    context 'with block' do
      subject { cell_collection.to_s(&:itself) }

      it 'should call block' do
        expect(subject).to eq("aab\nc")
      end
    end
  end

  private

  # Convenience vertex coordinate
  def vc(x, y)
    Bloqus::VertexCoordinate.new(x, y)
  end
end
