require_relative '../linked_list'

first_node = 'First'
middle_node = 'Middle'
last_node = 'Last'
another_node = 'Another'
insert_node = "Insert"
ll = LinkedList.new
ll.add(first_node)
ll.add(middle_node)

ll.add(last_node)
puts "get 0 #{ll.get(0)}"
# puts "get 1 #{ll.get(1)}"
# puts "get 2 #{ll.get(2)}"
# puts "after set another node"
# ll.set(0,another_node)
# puts "get 0 #{ll.get(0)}"
# puts "get 1 #{ll.get(1)}"
# puts "get 2 #{ll.get(2)}"
# puts "after insert node"
# ll.insert(0, insert_node)
# puts "get 0 #{ll.get(0)}"
# puts "get 1 #{ll.get(1)}"
# puts "get 2 #{ll.get(2)}"
# puts "get 3 #{ll.get(3)}"

# ll.set(11,"x")

# nl = LinkedList.new
# # puts nl.first
# nl.set(0,first_node)
ll.insert(1,"Extra")
#
# puts "ll length is #{ll.length}"
