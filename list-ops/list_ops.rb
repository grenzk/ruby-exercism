# frozen_string_literal: true

# Basic List Operations
class ListOps
  def self.arrays(list)
    count = 0
    list.each { |_element| count += 1 }
    count
  end

  def self.reverser(list)
    return list if list.empty?

    list.last.downto(list.first).to_a
  end

  def self.concatter(list1, list2)
    list1 + list2
  end

  def self.mapper(list)
    arr = []
    list.each { |element| arr << element + 1 }
    arr
  end

  def self.filterer(list)
    arr = []
    list.each { |element| arr << element if yield(element) }
    arr
  end

  def self.sum_reducer(list)
    sum = 0
    list.each { |element| sum += element }
    sum
  end

  def self.factorial_reducer(list)
    product = 1
    list.each { |element| product *= element }
    product
  end
end
