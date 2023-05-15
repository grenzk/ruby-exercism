# frozen_string_literal: true

class Isogram
  def self.isogram?(word)
    new_word = word.downcase.gsub(/[- ]+/, '')

    new_word.chars.all? { |letter| new_word.count(letter) == 1 }
  end
end
