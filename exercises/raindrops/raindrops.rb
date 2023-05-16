# frozen_string_literal: true

class Raindrops
  RAINDROP_SOUNDS = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }.freeze

  def self.convert(number)
    sounds =
      RAINDROP_SOUNDS
        .keys
        .select { |key| (number % key).zero? }
        .map { |key| RAINDROP_SOUNDS[key] }
        .join

    return number.to_s if sounds.empty?

    sounds
  end
end
