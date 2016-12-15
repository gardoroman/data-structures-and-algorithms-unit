require_relative 'array_list'

class MySet

  attr_accessor :set_container

  def initialize
    @set_container = ArrayList.new
  end

  def add(element)
    set_container.add(element) if !contains?(element)
  end

  def size
    @set_container.length
  end

  def contains?(element)
    @set_container.each do |item|
      return true if item == element
    end
  end

  def remove(element)
    position = search_index(element)
    @set_container.delete_at(position) if position
  end

  def union(other_set)
    if size >= other_set.size
      union_set = Marshal.load(Marshal.dump(self))
      set2 = other_set
    else
      union_set = Marshal.load(Marshal.dump(other_set))
      set2 = self
    end
    set2.set_container.each do |element|
      union_set.add(element)
    end
    union_set
  end

  def intersection(other_set)
    intersection_set = MySet.new
    if size >= other_set.size
      set1 = Marshal.load(Marshal.dump(self))
      set2 = other_set
    else
      set1 = Marshal.load(Marshal.dump(other_set))
      set2 = self
    end
    set2.set_container.each do |element|
      intersection_set.add(element) if set1.contains?(element)
    end
    intersection_set
  end

  def difference(other_set)
    difference_set = MySet.new
    set_container.each do |element|
      difference_set.add(element) if !other_set.contains?(element)
    end
    difference_set
  end

  def subset?(other_set)
    other_set.size == intersection(other_set).size
  end

  def to_s
    @set_container.to_s
  end

  private

  def search_index(element)
    @set_container.each_with_index do |item, index|
      return index if item == element
    end
  end

end
