# frozen_string_literal: true

class Matrix
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def rows
    string.split("\n").map { |str| str.split.map(&:to_i) }
  end

  def columns
    rows.transpose
  end

  def saddle_points
    row_values = rows.map(&:max)
    column_values = columns.map(&:min)
    points = row_values & column_values

    if row_values.all? { |num| points.include?(num) }
      return(
        row_values.map.with_index { |num, idx| [idx, column_values.index(num)] }
      )
    end

    points.map { |num| [row_values.index(num), column_values.index(num)] }
  end
end
