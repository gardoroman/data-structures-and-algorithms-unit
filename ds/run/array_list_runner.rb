require_relative '../array_list'

arr = ArrayList.new
arr.add("a")
arr.add('b')
arr.add('c')
arr.add('d')
arr.add('e')
x = arr.slice(2,1)

# arr.each {|i| puts i}
puts arr.to_s
puts x.to_s
# arr.delete_at(1)
puts arr.delete_at(3)
# puts arr.slice(0,1)

puts arr
