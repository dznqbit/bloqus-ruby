require 'spec_helper'
require 'bloqus/corner_finder'

describe Bloqus::CornerFinder do
  let(:cells) { simple_cells }
  let(:cell_corner_coordinates) { [vc(0, 0), vc(3, 0), vc(3, 1), vc(1, 1), vc(1, 2), vc(0, 2)] }

  let(:complex_cells) { cross_cells }
  let(:complex_cell_corner_coordinates) do
    [
      vc(1, 0), vc(2, 0),
      vc(2, 1), vc(3, 1), vc(3, 2), vc(2, 2),
      vc(2, 3), vc(1, 3), vc(1, 2),
      vc(0, 2), vc(0, 1), vc(1, 1)
    ]
  end

  let(:cell_collection) { Bloqus::CellCollection.new(cells) }
  let(:corner_finder) { described_class.new(cell_collection) }

  describe '#corners' do
    subject { corner_finder.corners.map(&:coordinates) }

    it 'should work' do
      expect(subject).to eq(cell_corner_coordinates)
    end

    context 'complex shape' do
      let(:cells) { complex_cells }

      it 'should work' do
        expect(subject).to eq(complex_cell_corner_coordinates )
      end
    end
  end

  describe '#first_corner' do
    subject { corner_finder.first_corner }

    context 'simple' do
      it { should eq(cell_collection.vertex(vc(0, 0))) }
    end

    context 'complex' do
      let(:cells) { complex_cells }
      it { should eq(cell_collection.vertex(vc(1, 0))) }
    end
  end

  describe '#next_clockwise_vertex' do
    let(:vertex) { cell_collection.vertex(vertex_coordinates) }

    context 'Simple Shape' do
      subject { corner_finder.next_clockwise_vertex(vertex) }

      context 'Corner 1' do
        let(:vertex_coordinates) { cell_corner_coordinates[0] }
        it { should eq(cell_collection.vertex(cell_corner_coordinates[1])) }
      end

      context 'Corner 2' do
        let(:vertex_coordinates) { cell_corner_coordinates[1] }
        it { should eq(cell_collection.vertex(cell_corner_coordinates[2])) }
      end

      context 'Corner 3' do
        let(:vertex_coordinates) { cell_corner_coordinates[2] }
        it { should eq(cell_collection.vertex(cell_corner_coordinates[3])) }
      end

      context 'Corner 4' do
        let(:vertex_coordinates) { cell_corner_coordinates[3] }
        it { should eq(cell_collection.vertex(cell_corner_coordinates[4])) }
      end

      context 'Corner 5' do
        let(:vertex_coordinates) { cell_corner_coordinates[4] }
        it { should eq(cell_collection.vertex(cell_corner_coordinates[5])) }
      end

      context 'Corner 6' do
        let(:vertex_coordinates) { cell_corner_coordinates[5] }
        it { should eq(cell_collection.vertex(cell_corner_coordinates[0])) }
      end
    end
  end
end
