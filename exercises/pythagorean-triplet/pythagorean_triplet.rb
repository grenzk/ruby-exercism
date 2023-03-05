# frozen_string_literal: true

class Triplet
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def sum
    a + b + c
  end

  def product
    a * b * c
  end

  def pythagorean?
    (a**2 + b**2) == c**2
  end

  def self.where(max_factor:, min_factor: 1, sum: 0)
    (min_factor..max_factor).each_with_object([]) do |a, triplets|
      (a + 1..max_factor).each do |b|
        (b + 1..max_factor).each do |c|
          trio = new(a, b, c)
          triplets << trio if trio.pythagorean? && (sum.zero? || trio.sum == sum)
        end
      end
    end
  end
end
