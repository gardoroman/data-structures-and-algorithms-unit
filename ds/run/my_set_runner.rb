require_relative '../my_set'

s1 = MySet.new

s2 = MySet.new

s1.add("a")
s1.add("b")
s1.add("c")
s2.add("c")
s2.add("d")
s2.add("a")
s2.add("e")
p s1.to_s
p s1.union(s2).to_s
p s1.to_s

p s2.to_s
p s1.intersection(s2).to_s
p s2.to_s
