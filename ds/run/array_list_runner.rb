require_relative '../array_list'

arr = ArrayList.new
arr.add(1)
arr.add('b')
arr.add('c')
arr.add('d')

# arr.each {|i| puts i}
puts arr.to_s
