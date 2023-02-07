# frozen_string_literal: true

class PrimeFactors
  def self.of(num)
    arr = []
    factor = 2

    while num > 1
      until num % factor != 0
        num /= factor
        arr << factor
      end
      factor += 1
    end
    arr
  end
end
