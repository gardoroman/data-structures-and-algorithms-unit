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

arr.each_with_index do |item, index|
  puts "item is #{item} index is #{index}"
end
#
# aa = ArrayList.new
# ab = ArrayList.new
#
# aa.add(1)
# aa.add(2)
# ab.add(3)
# ab.add(4)
# puts "array 1 #{aa}"
# puts "array 2 #{ab}"
# ab << aa
# puts ab
