require 'spec_helper'
require 'bloqus/coordinates'

describe Bloqus::Coordinates do
  let(:x) { 3 }
  let(:y) { 2 }

  let(:coordinates) { described_class.new(x, y) }
  subject { coordinates }

  its(:x) { should be(x) }
  its(:y) { should be(y) }
  its(:to_a) { should eq([3, 2]) }
  its(:to_s) { should eq('(3,2)') }

  describe '::zero' do
    subject { described_class.zero }
    its(:to_a) { should eq([0, 0]) }

    it 'should be singleton' do
      expect(subject).to be(described_class.zero)
    end
  end
end
