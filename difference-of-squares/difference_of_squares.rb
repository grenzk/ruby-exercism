class Squares
  def initialize(num)
    @squares = (1..num).to_a
  end

  def square_of_sum
    @squares.sum**2
  end

  def sum_of_squares
    @squares.map { |num| num**2 }.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
