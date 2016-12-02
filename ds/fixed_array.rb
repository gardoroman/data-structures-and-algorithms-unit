class OutOfBoundsException < StandardError; end

class FixedArray

  attr_accessor :array

  def initialize(size=0)
    @array = Array.new(size.to_i)
  end

  # returns the length of the array
  def size
    array.length
  end

  # retrieves value at given index
  def get(index)
    index = index.to_i
    raise OutOfBoundsException unless valid_index?(index)
    array[index]
  end

  # sets value at given index.
  # Will raise OutOfBoundsException if index values
  # greater than array size
  def set(index, value)
    index = index.to_i
    raise OutOfBoundsException unless valid_index?(index)
    array[index] = value
  end

  private

  # returns true if index is greater than Zero
  # or index is within the size limit of the array
  def valid_index?(index)
    index >= 0 && index < self.size
  end

end
