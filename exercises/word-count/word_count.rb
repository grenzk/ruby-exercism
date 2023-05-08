# frozen_string_literal: true

class Phrase
  attr_reader :words

  def initialize(words)
    @words = words.downcase.gsub(/[^a-zA-Z0-9']+/, ' ')
  end

  def word_count
    words
      .split
      .map { |word| word.delete_prefix("'").delete_suffix("'") }
      .delete_if { |word| word == '' }
      .tally
  end
end
