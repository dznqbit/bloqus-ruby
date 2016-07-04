require 'spec_helper'

describe Bloqus::TextCellPresenter do
  let(:border) { false }
  let(:cells) { [[true, true, true], [true, false, false]] }

  let(:text_cell_presenter) { described_class.new(cells: cells, border: border) }

  describe '#to_s' do
    subject { text_cell_presenter.to_s }

    it 'should output correctly' do
      expect(subject).to eq("...\n.  ")
    end

    context 'with border=true' do
      let(:border) { true }

      it 'should surround with border' do
        expect(subject).to eq("+---+\n|...|\n|.  |\n+---+")
      end
    end
  end
end
