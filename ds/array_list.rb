require_relative 'fixed_array'
require_relative 'ds_exceptions'


class ArrayList

  attr_accessor :array_list

  def initialize(size=0)
    @array_list = FixedArray.new(size)
  end

  # return length of ArrayList
  def length
    array_list.length
  end

  # add element to end of ArrayList
  def add(element)
    temp_list = array_list
    @array_list = FixedArray.new(length + 1)
    (length - 1).times do |index|
      @array_list.set(index, temp_list.get(index))
    end
    @array_list.set(length - 1, element)
  end

  # set an element at the specified index
  def set(index, element)
    @array_list.set(index, element)
  end

  # return an element at the specified index
  def get(index)
    @array_list.get(index)
  end

  # insert an element at the specified index
  # Any elements >= to the index will be shifted to the right
  def insert(index, element)
    raise OutOfBoundsException unless valid_index?(index)

    temp_list = array_list
    @array_list = FixedArray.new(length + 1)
    (index -1).times do |below_index|
      array_list.set(below_index, temp_list.get(below_index))
    end

    array_list.set(index,element)

    (index + 1).upto(length - 1) do |above_index|
      @array_list.set(above_index, temp_list.get(index))
    end

    element
  end

  def to_s
    str = "["
    each do |element|
      if element.class == Fixnum
        str << element.to_s
      else
        str << "'#{element}'"
      end
      str << ","
    end
    str = str[0..str.length-2] + "]"
  end

  def each
    each_index = 0
    while each_index < self.length
      yield (get(each_index))
      each_index += 1
    end
  end

  private

  # returns true if index is greater than Zero
  # or index is within the size limit of the array
  def valid_index?(index)
    index >= 0 && index < self.length
  end

    # copies "num" elements of an ArrayList
  # at index indicated by "start"
  def slice(start, num)
    temp_list = FixedArray.new(num)
    num.times do |index|
      # puts "index is #{index}"
      temp_list.set(index, @array_list.get(start))
      start += 1
    end
    temp_list
  end


end
