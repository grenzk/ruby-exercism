# frozen_string_literal: true

class Matrix
  attr_reader :string, :row_values, :column_values

  def initialize(string)
    @string = string
    @row_values = rows.map(&:max)
    @column_values = columns.map(&:min)
  end

  def rows
    string.split("\n").map { |str| str.split.map(&:to_i) }
  end

  def columns
    rows.transpose
  end

  def saddle_points
    values = row_values & column_values

    values.each_with_object([]) do |value, points|
      row_values.each_with_index do |row_value, i|
        column_values.each_with_index do |column_value, j|
          points << [i, j] if row_value == value && column_value == value
        end
      end
    end
  end
end
