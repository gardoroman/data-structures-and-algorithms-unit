require_relative 'fixed_array'

class ArrayList

  attr_accessor :array_list, :internal_list

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

  # def set_internal_list
  #   @internal_list = FixedArray.new(1)
  #   @internal_list.set(0, array_list)
  # end

end
