require 'spec_helper'
require 'bloqus/cell_collection'

describe Bloqus::Vertex do
  let(:cells) { simple_cells }
  let(:cell_collection) { Bloqus::CellCollection.new(cells) }

  subject { cell_collection.vertex(coordinates) }

  describe '#corner?' do
    context 'when vertex is a corner' do
      let(:coordinates) { vc(0, 0) }
      its(:corner?) { should be(true) }
    end

    context 'when vertex is not a corner' do
      let(:coordinates) { vc(1, 0) }
      its(:corner?) { should be(false) }
    end

    context 'when shape is box' do
      let(:cells) { box_cells }
      let(:coordinates) { vc(1, 1) }
      its(:corner?) { should be(false) }
    end
  end
end
