require_relative 'linked_list'
require_relative 'ds_exceptions'

class Stack

  attr_accessor :linked_list

  def initialize
    @linked_list = LinkedList.new
  end

  def push(element)
    node = Node.new(element)
    linked_list.insert(0,node)
    element
  end

  def pop
    popped_element = linked_list.first
    @linked_list.first = popped_element.next_node
    popped_element.to_s
  end

  def top
    linked_list.first.to_s
  end

  def empty?
    linked_list.length == 0
  end

end
