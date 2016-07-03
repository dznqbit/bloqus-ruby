module Bloqus
  class TextCellPresenter
    def initialize(cells:)
      @cells = cells
    end

    def to_s
      cells.map do |row|
        row.map { |cell| map(cell) }.join('')
      end.join("\n")
    end

    private

    attr_reader :cells

    def map(cell)
      case cell
      when Colors::BLUE   then 'b'
      when Colors::YELLOW then 'y'
      when Colors::RED    then 'r'
      when Colors::GREEN  then 'g'
      when true           then '.'
      when false          then ' '
      else
        cell
      end
    end
  end
end
