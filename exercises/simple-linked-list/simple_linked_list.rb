# frozen_string_literal: true

class Element
  attr_accessor :datum, :next

  def initialize(number)
    @datum = number
    @next = nil
  end
end

class SimpleLinkedList
  attr_accessor :elements

  def initialize(array = [])
    @elements = array.map { |el| Element.new(el) }
  end

  def push(element)
    elements << element
    self
  end

  def pop
    elements.pop
  end

  def to_a
    elements.map(&:datum).reverse
  end

  def reverse!
    elements.reverse!
    self
  end
end
