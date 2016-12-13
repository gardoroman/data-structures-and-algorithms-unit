require_relative '../tree_list'

tl = TreeList.new("m")
# puts tl.root.value
# puts tl.root.children.length
tl.add("a")
tl.add("d")
tl.add("c")
# puts tl.root.children.get(0).children

tl.add("z")

puts "******\n\n#{tl.root.children}"
