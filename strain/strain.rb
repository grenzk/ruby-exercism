class Array
  def keep
    each_with_object([]) { |item, arr| arr << item if yield(item) }
  end

  def discard
    each_with_object([]) { |item, arr| arr << item unless yield(item) }
  end
end
