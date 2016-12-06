require_relative '../linked_list'

first_node = Node.new('First')
middle_node = Node.new('Middle')
last_node = Node.new('Last')
another_node = Node.new('Another')
insert_node = Node.new("Insert")
ll = LinkedList.new
ll.add(first_node)
ll.add(middle_node)

ll.add(last_node)
puts "get 0 #{ll.get(0).element}"
puts "get 1 #{ll.get(1).element}"
puts "get 2 #{ll.get(2).element}"
puts "after set another node"
ll.set(0,another_node)
puts "get 0 #{ll.get(0).element}"
puts "get 1 #{ll.get(1).element}"
puts "get 2 #{ll.get(2).element}"
puts "after insert node"
ll.insert(0, insert_node)
puts "get 0 #{ll.get(0).element}"
puts "get 1 #{ll.get(1).element}"
puts "get 2 #{ll.get(2).element}"
puts "get 3 #{ll.get(3).element}"
puts ll.length

# ll.set(11,"x")

nl = LinkedList.new
# puts nl.first
