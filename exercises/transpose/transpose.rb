# frozen_string_literal: true

class Transpose
  def self.transpose(str)
    return '' if str.empty?

    matrix = str.split("\n")
    transposed_matrix = []

    matrix.map(&:length).max.times do |idx|
      transposed_matrix << matrix.map { |text| text[idx] }.map { |char| char || '*' }.join
    end

    clean(transposed_matrix)
  end

  def self.clean(transposed_matrix)
    transposed_matrix.map do |text|
      text[text.rindex(/[^*]/) + 1..] = '' if text.include?('*')
      text.tr('*', ' ')
    end
      .join("\n")
  end
end
