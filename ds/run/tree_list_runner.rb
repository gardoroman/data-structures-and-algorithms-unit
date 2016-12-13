require_relative '../tree_list'

tl = TreeList.new("m")
# puts tl.root.value
# puts tl.root.children.length
tl.add("b")
tl.add("d")
tl.add("c")
tl.add("a")
# puts tl.root.children.get(0).children

tl.add("z")
tl.add("e")

# puts "******\n\n#{tl.root.children}"
# puts "******\n\n#{tl.root.children.get(0)}"
# puts "******\n\n#{tl.root.children.get(1)}"


puts tl.view

puts tl.index_of("m")
