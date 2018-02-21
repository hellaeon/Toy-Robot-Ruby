class Table

  def initialize(width, height)
    @length = width
    @width = height
  end

  def is_valid_position?(pos_x, pos_y)
    pos_x < @length &&
        pos_y < @width &&
        pos_x >= 0 &&
        pos_y >= 0
  end

end