# frozen_string_literal: true

class Triplet
  attr_reader :sides

  def initialize(*sides)
    @sides = sides
  end

  def sum
    sides.reduce(:+)
  end

  def product
    sides.reduce(:*)
  end

  def pythagorean?
    sides.last**2 == sides.first(2).map { |num| num**2 }.sum
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
