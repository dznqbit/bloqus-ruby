module BloqusSpecHelper
  def simple_cells
    [[true, true, true], [true]]
  end

  def cross_cells
    [[false, true, false], [true, true, true], [false, true, false]]
  end

  def box_cells
    [[true, true], [true, true]]
  end

  protected

  # Convenience vertex coordinates
  def vc(x, y)
    Bloqus::VertexCoordinates.new(x, y)
  end

  # Convenience cell coordinates
  def cc(x, y)
    Bloqus::CellCoordinates.new(x,y )
  end
end
