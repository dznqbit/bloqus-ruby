require 'spec_helper'
require 'bloqus/cell_collection'

describe Bloqus::Vertex do
  let(:cells) { simple_cells }
  let(:cell_collection) { Bloqus::CellCollection.new(cells) }

  subject { described_class.new(cell_collection: cell_collection, coordinates: coordinates) }

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

  describe '#next' do
    let(:cells) { [[true, true, true], [true, true]] }

    context 'when on convex corner' do
      let(:coordinates) { vc(0, 0) }
      its(:next) { should eq(vc(1, 0)) }
    end

    context 'when in middle edge' do
      let(:coordinates) { vc(1, 0) }
      its(:next) { should eq(vc(2, 0)) }
    end

    context 'when in concave corner' do
      let(:coordinates) { vc(2, 1) }
      its(:next) { should eq(vc(2, 2)) }
    end
  end
end
