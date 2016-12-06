class Node

  attr_accessor :element, :next_node

  def initialize(element, next_node=nil)
    @element = element
    @next_node = next_node
  end

end



# LinkedList#new():
# LinkedList#get_first():
# LinkedList#remove_first():
# LinkedList#insert_first():
#
# LinkedList#get_last():
# LinkedList#remove_last():
# LinkedList#insert_last(): (see add)
# LinkedList#add(element):
# LinkedList#get(position):
# LinkedList#set(position, element):
# LinkedList#insert(position, element);
# LinkedList#length():
