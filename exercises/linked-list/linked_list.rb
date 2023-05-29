# frozen_string_literal: true

class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end

class Deque
  def initialize
    @head = nil
    @tail = nil
  end

  def push(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
    else
      @tail.next_node = new_node
    end

    @tail = new_node
  end

  def pop
    return nil if @head.nil?

    value = @tail.value

    if @head == @tail
      @head = nil
      @tail = nil
    else
      @tail = find_node_before_tail
      @tail.next_node = nil
    end

    value
  end

  def shift
    return nil if @head.nil?

    value = @head.value
    @head = @head.next_node

    @tail = nil if @head.nil?

    value
  end

  def unshift(value)
    new_node = Node.new(value)

    if @head.nil?
      @tail = new_node
    else
      new_node.next_node = @head
    end

    @head = new_node
  end

  private

  def find_node_before_tail
    current_node = @head

    current_node = current_node.next_node while current_node.next_node != @tail

    current_node
  end
end
