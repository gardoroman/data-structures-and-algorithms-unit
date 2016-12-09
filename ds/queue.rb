require_relative 'linked_list'
require_relative 'ds_exceptions'

class Queue

  def initialize
    @linked_list = LinkedList.new
  end

  def enqueue(element)
    node = Node.new(element)
    @linked_list.add(node)
    node.element
  end

  #enqueue not working if another element is added
  def dequeue
    removed_element = @linked_list.first.element
    if @linked_list.length > 1
      @linked_list.first = @linked_list.first.next_node
    else
      @linked_list = LinkedList.new
    end
    removed_element
  end

  def peel
    @linked_list.first.element
  end

  def empty?
    @linked_list.length == 0
  end

end
