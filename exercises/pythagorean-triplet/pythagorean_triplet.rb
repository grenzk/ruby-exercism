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
    a**2 + b**2 == c**2
  end

  def self.where(max_factor:, min_factor: 1, sum: 0)
    triplets = []

    (min_factor..max_factor)
      .to_a
      .combination(3) do |combo|
        trio = new(combo[0], combo[1], combo[2])
        triplets << trio if trio.pythagorean? && (sum.zero? || trio.sum == sum)
      end
    triplets
  end
end
