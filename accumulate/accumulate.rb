class Array
  def accumulate(&block)
    return self.enum_for(:accumulate) unless block_given?
    each_with_object([]) { |i, a| a << block.call(i) }
  end
end
