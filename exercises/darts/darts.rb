class Darts
  def initialize(x_value, y_value)
    @x_value = x_value
    @y_value = y_value
  end

  def score
    radius = Math.sqrt((@x_value**2) + (@y_value**2))
    return 1 if radius <= 10 && radius > 5
    return 5 if radius <= 5 && radius > 1
    return 10 if radius <= 1
    0
  end
end
