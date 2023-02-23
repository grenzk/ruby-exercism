# frozen_string_literal: true

class SumOfMultiples
  attr_reader :divisors

  def initialize(*divisors)
    @divisors = divisors
  end

  def to(limit)
    (0...limit)
      .select do |num|
        divisors.any? do |divisor|
          next if divisor.zero?

          (num % divisor).zero?
        end
      end
      .sum
  end
end
