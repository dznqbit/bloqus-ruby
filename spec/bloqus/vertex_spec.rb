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

    context 'when vertex is a corner' do
      let(:coordinates) { vc(3, 0) }
      it { should be(true) }
    end

    context 'when vertex is a corner' do
      let(:coordinates) { vc(3, 1) }
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
    subject { vertex.edges.force }

    let(:coordinates) { vc(2, 1) }

    let(:right_vc) { vc(3, 1) }
    let(:down_vc)  { vc(2, 2) }
    let(:left_vc)  { vc(1, 1) }
    let(:up_vc)    { vc(2, 0) }

    let(:edges) { [
      edge(coordinates, right_vc),
      edge(coordinates, down_vc),
      edge(coordinates, left_vc),
      edge(coordinates, up_vc)
    ] }

    it { should eq(edges) }
  end

  private

  def edge(vc1, vc2)
    cell_collection.edge(vc1, vc2)
  end
end
