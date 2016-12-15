require_relative '../map'


m = Map.new

puts m.length
puts m.set("a","stored value")


puts m.length

puts "returning a #{m.get("a")}"
puts m.set("a","override")
puts "returning a #{m.get("a")}"
puts m.length

im = Map.new

im.set("a", "first")
im.set("b", "second")
im.set("c", "third")

puts im.remove_key("b")


im.iterate do |key, value|
  puts key
  puts value.class
end
