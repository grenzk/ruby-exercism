class Triangle
  def initialize(sides)
    @x, @y, @z = sides.sort
  end

  def check_if_triangle
    @x > 0 and @x + @y >= @z
  end

  def equilateral?
    check_if_triangle and @x == @z
  end
  def isosceles?
    check_if_triangle and (@x == @y or @y == @z)
  end

  def scalene?
    check_if_triangle and (!equilateral? and !isosceles?)
  end
end