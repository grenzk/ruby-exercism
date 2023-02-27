# frozen_string_literal: true

class Triangle
  attr_reader :number_of_rows

  def initialize(number_of_rows)
    @number_of_rows = number_of_rows
  end

  def rows
    triangle = [[1]]

    (1..number_of_rows - 1).each do |i|
      row = [1]
      (1..i - 1).each { |j| row << triangle[i - 1][j - 1] + triangle[i - 1][j] }
      row << 1
      triangle << row
    end
    triangle
  end
end
