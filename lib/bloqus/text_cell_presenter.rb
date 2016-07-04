module Bloqus
  class TextCellPresenter
    def initialize(cells:, border: false)
      @cells = cells
      @border = border
    end

    def to_s
      my_rows = rows

      if border
        width = my_rows.first.length
        border_bar_str = "+#{ '-' * width }+"

        [border_bar_str] +
        my_rows.map { |s| "|#{s}|" } +
        [border_bar_str]
      else
        my_rows
      end.join("\n")
    end

    private

    attr_reader :cells, :border

    def rows
      cells.map do |row|
        row.map { |cell| cell_s(cell) }.join('')
      end
    end

    def cell_s(cell)
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
