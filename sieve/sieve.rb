class Sieve
  def initialize(num)
    @num = num
    @numbers = (2..@num).to_a
  end

  def primes
    (2..@num).each do |first_num|
      @numbers.reject! { |num| num % first_num == 0 && num > first_num }
    end
    @numbers
  end
end
