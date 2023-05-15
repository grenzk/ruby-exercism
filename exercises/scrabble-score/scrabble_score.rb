# frozen_string_literal: true

class Scrabble
  LETTERS = [
    %w[A E I O U L N R S T],
    %w[D G],
    %w[B C M P],
    %w[F H V W Y],
    %w[K],
    %w[J X],
    %w[Q Z]
  ].freeze

  attr_reader :string_input

  def initialize(string_input)
    @string_input = string_input.upcase
  end

  def score
    string_input
      .chars
      .map do |letter|
        grp_of_letters = LETTERS.find { |letters| letters.include?(letter) }
        value = LETTERS.index(grp_of_letters) + 1

        value += 2 if value == 6
        value += 3 if value == 7
        value
      end
      .sum
  end
end
