class Pangram
  ALPHABET = ('a'..'z')

  def self.pangram?(sentence)
    ALPHABET.all? {|letter| sentence.downcase.include?(letter)}
  end
end
