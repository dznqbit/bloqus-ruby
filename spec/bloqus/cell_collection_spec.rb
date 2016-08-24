require 'spec_helper'
require 'bloqus/cell_collection'

describe Bloqus::CellCollection do
  subject { cell_collection }

  let(:cell_collection) { described_class.new(cells) }

  describe '::new' do
    context 'one row is shorter than the others' do
      let(:cells) { simple_cells }

      it 'should unify length of all rows' do
        expect(subject.to_a).to eq([[true, true, true], [true, nil, nil]])
      end
    end
  end

  describe '#cell' do
    let(:cells) { simple_cells }
    subject { cell_collection.cell(coordinate) }

    context 'coordinate inside collection space' do
      let(:coordinate) { Bloqus::Coordinates.new(0, 0) }
      it { expect(subject.filled?).to be true }
    end

    context 'coordinate outside collection space' do
      context 'too big' do
        let(:coordinate) { Bloqus::Coordinates.new(5, 0) }
        it { expect(subject.filled?).to be false }
      end

      context 'too small' do
        let(:coordinate) { Bloqus::Coordinates.new(-1, 0) }
        it { expect(subject.filled?).to be false }
      end
    end
  end
end
