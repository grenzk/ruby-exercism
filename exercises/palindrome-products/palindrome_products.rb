# frozen_string_literal: true

class Palindromes
  attr_reader :max_factor, :min_factor, :value

  def initialize(max_factor:, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
  end

  def palindrome?(num)
    num.to_s.reverse.to_i == num
  end

  def generate
    products = []

    (min_factor..max_factor)
      .to_a
      .repeated_combination(2) { |pair| products << pair[0] * pair[1] }

    products.uniq.select { |num| palindrome?(num) }
  end

  def largest
    @value = generate.max
    self
  end

  def smallest
    @value = generate.min
    self
  end

  def factors_within_range(pairs)
    pairs.select do |pair|
      pair[1] >= pair[0] && pair[1].between?(min_factor, max_factor)
    end
  end

  def factors
    pairs = []

    (min_factor...max_factor).each do |factor1|
      if (value % factor1).zero?
        factor2 = value / factor1
        pairs << [factor1, factor2]
      end
    end
    factors_within_range(pairs)
  end
end
