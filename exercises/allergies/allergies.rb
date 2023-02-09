# frozen_string_literal: true

# Allergy score test
class Allergies
  ITEMS = {
    'eggs' => 1,
    'peanuts' => 2,
    'shellfish' => 4,
    'strawberries' => 8,
    'tomatoes' => 16,
    'chocolate' => 32,
    'pollen' => 64,
    'cats' => 128
  }.freeze

  attr_reader :score, :allergy_scores

  def initialize(score)
    @score = score
    @allergy_scores = generate_geometric_sequence
  end

  def allergic_to?(item)
    return false if allergy_scores.empty?

    generate_addends.map { |score| ITEMS.key(score) }.include?(item)
  end

  def list
    generate_addends.map { |score| ITEMS.key(score) }.delete_if(&:nil?)
  end

  private

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
