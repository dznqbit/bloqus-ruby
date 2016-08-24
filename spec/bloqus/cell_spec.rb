require 'spec_helper'
require 'bloqus/cell_collection'

describe Bloqus::Cell do
  let(:cell_collection) { simple_cell_collection }
  let(:val) { true }
  let(:cell) { cell_collection.cell(coordinates) }

  describe '#filled?' do
    subject { cell.filled? }

    context 'when cell is truthy' do
      let(:coordinates) { cc(0, 0) }
      it { should be true }
    end

    context 'when cell is not truthy' do
      let(:coordinates) { cc(1, 1) }
      it { should be false }
    end
  end
end
