class Node

  attr_accessor :element, :next_node

  def initialize(element, next_node=nil)
    @element = element
    @next_node = next_node
  end

  def to_s
    element
  end
end
