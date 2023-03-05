# typed: true
# frozen_string_literal: true

require 'sorbet-runtime'

class Triplet
  extend T::Sig

  sig { returns(T::Array[Integer]) }
  attr_reader :sides

  sig { params(sides: Integer).void }
  def initialize(*sides)
    @sides = sides
  end

  def sum
    sides.reduce(:+)
  end

  def product
    sides.reduce(:*)
  end

  sig { returns(T::Boolean) }
  def pythagorean?
    T.must(sides.last)**2 == sides.first(2).map { |num| num**2 }.sum
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
