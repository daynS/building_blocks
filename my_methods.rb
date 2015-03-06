module Enumerable
  def my_each
    return self unless block_given?
    for i in self
      yield(i)
    end
  end

  def my_each_with_index
    return self unless block_given?
    for i in 0...length
      yield(self[i], i)
    end
  end

  def my_select
    return self unless block_given?
    matches = []
    my_each {|i| matches << i if yield(i)}
    matches
  end

  def my_all?
    if block_given?
      my_each {|i| return false unless yield(i)}
    else
      my_each {|i| return false unless i}
    end
    true
  end

  def my_any?
    if block_given?
      my_each { |i| return true if yield(i) }
    else
      my_each { |i| return true if i }
    end
    false
  end

  def my_none?
    if block_given?
      my_each { |i| return false if yield(i) }
    else
      my_each { |i| return false if i }
    end
    true
  end

  def my_count(s_term=nil)
    counter = 0
    if block_given?
      my_each { |i| counter += 1 if yield(i) }
    elsif (s_term != nil)
      my_each { |i| counter += 1 if i == s_term }
    else
      my_each { |i| counter += 1}
    end
    counter
  end

=begin
  def my_map
    return self unless block_given?
    array = []
    self.my_each { |i| array << yield(i)}
    array
  end
=end

  def my_inject(num = 0)
    total = num
    my_each { |i| total = yield(total, i) }
    total
  end

  def my_map(code_block)
    array = []
    if code_block
      my_each do |i|
        array << code_block.call(i)
      end
      return array
    else
      return self
    end
  end

end

def multiply_els(list)
    list.my_inject(1) { |product, i| product * i }
end

array = (1..4).to_a
puts multiply_els(array)