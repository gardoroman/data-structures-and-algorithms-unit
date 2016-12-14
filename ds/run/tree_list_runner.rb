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
tl.add("h")
tl.add("l")
# tl.add("i")

# puts "******\n\n#{tl.root.children}"
# puts "******\n\n#{tl.root.children.get(0)}"
# puts "******\n\n#{tl.root.children.get(1)}"


puts tl.view

p tl.index_of("e")
p tl.ordered_index("h")
