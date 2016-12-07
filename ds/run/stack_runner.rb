require_relative '../stack'

stack = Stack.new

a = stack.push("a")
b = stack.push("b")
c = stack.push("c")

puts stack.pop
puts stack.pop
