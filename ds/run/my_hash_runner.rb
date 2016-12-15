require_relative '../my_hash'

jm = MyHash.new(50)
jm.set("blakey", "drums")
jm.set("silver", "piano")
jm.set("mobley", "sax")

jm.iterate {|k,v| puts "#{k} plays #{v}"}

# jm.iterate {|k, v| p k}
