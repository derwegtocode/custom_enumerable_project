module Enumerable
  
  # Your code goes here
  def my_each_with_index
    if block_given?
      i = 0
      until i == self.length do
        yield(self[i], i)
        i += 1
      end
    end
    self
  end

  def my_select
    selected = []
    i = 0
    until i == self.length do
      selected << self[i] if yield(self[i])
      i += 1
    end
    selected     
  end

  def my_all?
    if block_given?
      result = true
      my_each { |i| result = false if yield(i) == false}
      result
    else
      self
    end
  end

  def my_any?
    if block_given?
      result = false
      my_each { |i| result = true if yield(i) }
      result
    else
      self
    end
  end

  def my_none?
    if block_given?
      result = true
      my_each { |i| result = false if yield(i)}
      result
    else
      self
    end
  end

  def my_count
    count = 0
    if block_given?
      my_each { |i| count += 1 if yield(i) }
      count
    else
      my_each { |i| count += 1}
      count
    end
  end

  def my_map
    if block_given?
      mapped = []
      my_each { |i| mapped << yield(i) }
      mapped
    else
      self
    end
  end 

  def my_inject (accu = 0)
    if block_given?
      count = accu
      i = 0
      until i == self.length do
        count = yield(count, self[i])
        i += 1
      end
      count
    else
      self
    end
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if block_given?
      i = 0
      until i == self.length do
        yield(self[i])
        i += 1
      end
    end
    self
  end
end
