class ArmstrongNumbers

  def self.include?(number)
    arr = number.to_s.chars
    arr
    .map { |digit| digit.to_i ** arr.length }
    .sum == number
  end
end