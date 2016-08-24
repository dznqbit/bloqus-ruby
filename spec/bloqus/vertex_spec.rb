require 'spec_helper'
require 'bloqus/cell_collection'

describe Bloqus::Vertex do
  let(:cells) { simple_cells }
  let(:cell_collection) { Bloqus::CellCollection.new(cells) }
  let(:vertex) { cell_collection.vertex(coordinates) }

  describe '#corner?' do
    subject { vertex.corner? }

    context 'when vertex is a corner' do
      let(:coordinates) { vc(0, 0) }
      it { should be(true) }
    end

    context 'when vertex is not a corner' do
      let(:coordinates) { vc(1, 0) }
      it { should be(false) }
    end

    context 'when shape is box' do
      let(:cells) { box_cells }
      let(:coordinates) { vc(1, 1) }
      it { should be(false) }
    end
  end

  describe '#edges' do
    subject { vertex.edges }

    let(:coordinates) { vc(2, 2) }
  end
end
