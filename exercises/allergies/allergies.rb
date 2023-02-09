# typed: true
# frozen_string_literal: true

require 'sorbet-runtime'

# Allergy score test
class Allergies
  extend T::Sig

  ITEMS =
    T.let(
      {
        'eggs' => 1,
        'peanuts' => 2,
        'shellfish' => 4,
        'strawberries' => 8,
        'tomatoes' => 16,
        'chocolate' => 32,
        'pollen' => 64,
        'cats' => 128
      },
      T::Hash[String, Integer]
    )

  sig { returns(Integer) }
  attr_reader :score

  sig { returns(T::Array[Integer]) }
  attr_reader :allergy_scores

  sig { params(score: Integer).void }
  def initialize(score)
    @score = score
    @allergy_scores = T.let(generate_geometric_sequence, T::Array[Integer])
  end

  sig { params(item: String).returns(T::Boolean) }
  def allergic_to?(item)
    return false if allergy_scores.empty?

    generate_addends.map { |score| ITEMS.key(score) }.include?(item)
  end

  sig { returns(T::Array[T.nilable(String)]) }
  def list
    generate_addends.map { |score| ITEMS.key(score) }.delete_if(&:nil?)
  end

  private

  sig { returns(T::Array[Integer]) }
  def generate_geometric_sequence
    return [] if score.zero?

    sequence = [1]

    loop do
      next_term = sequence.last * 2
      break if score < next_term

      sequence << next_term
    end
    sequence
  end

  sig { returns(T::Array[Integer]) }
  def generate_addends
    combinations = []
    (1..allergy_scores.length).each do |i|
      allergy_scores
        .combination(i)
        .each { |combo| combinations << combo if combo.reduce(:+) == score }
    end
    combinations.flatten
  end
end
