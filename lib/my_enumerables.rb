module Enumerable
  # Your code goes here
  def my_each_with_index
    # to_enum(:my_each)
    index = 0
    my_each do |element|
      yield(element, index)
      index +=1
    end
  end

  def my_select
    result = []
    my_each do |element|
      result << element if yield(element)
    end
    result
  end

  def my_all?(&block)
    my_each do |element|
      return false unless block.call(element)
    end
    true
  end

  def my_none?(&block)

    my_each do |element|
      if yield(element)
        return false
      else true
      end
    end
    
  end

  def my_map(&block)
    result = []
    my_each do |element|
      result << block.call(element)
    end
    result
  end


end


# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  include Enumerable


  # Define my_each here
  def my_each
    for element in self do
    yield element
    end
  end


end
class Hash
  include Enumerable
end
