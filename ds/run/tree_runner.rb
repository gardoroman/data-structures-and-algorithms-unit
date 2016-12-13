tree = Tree.new("body")

first_div = tree.node.add_child("div")
second_div= tree.node.add_child("div")
third_div= tree.node.add_child("div")
first_p = second_div.add_child("p")
second_p = second_div.add_child("p")
only_b = second_p.add_child("b")

p tree.search("b")
