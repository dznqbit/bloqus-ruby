require 'spec_helper'

describe Bloqus::Piece do
  describe '::standard' do
    let(:file_path) { File.join(File.split(__FILE__)[0], '../../data/pieces.txt') }
    subject { described_class.load(file_path) }

    it 'should load 21 pieces' do
      expect(subject.count).to be(21)
    end
  end

  describe '::from_s' do
    subject { described_class.from_s(s) }
    let(:s) { " . \n...\n .." }

    it 'should work' do
      expect(subject.cells).to eq([[false, true, false], [true, true, true], [false, true, true]])
    end
  end

  describe '#to_s' do
    subject { described_class.from_s(s) }
    let(:s) { " . \n...\n .." }

    it 'should work' do
      expect(subject.to_s).to eq(s)
    end
  end

  describe '::new' do
    subject { described_class.new(cells) }

    context 'one row is shorter than the others' do
      let(:cells) { [[true, true, true], [true]] }

      it 'should unify length of all rows' do
        expect(subject.cells).to eq([[true, true, true], [true, false, false]])
      end
    end
  end
end
