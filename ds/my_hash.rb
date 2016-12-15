class MyHash

  attr_accessor :hash_collection, :length

  def initialize(size=100)
    @hash_collection = Array.new(size)
  end

  def set(key, value)
    hash_value = get_hash(key,nil)
    puts hash_value
    @hash_collection[hash_value] = [key, value]
    key
  end

  def get(key)
    hash_value = get_hash(key,nil,true)
    return @hash_collection[hash_value][1] if @hash_collection[hash_value]
    hash_value = get_hash(key,nil,true)
    nil
  end

  def has_key?(key)
    hash_value = get_hash(key,nil,true)
    return true if @hash_collection[hash_value]
  end

  def length
    @hash_collection.length
  end

  def remove(key)
    hash_value = get_hash(key,nil,true)
    @hash_collection.delete_at(hash_value) if @hash_collection[hash_value]
  end

  def iterate
    @hash_collection.each do |item|
      yield item[0], item[1] if item
    end
  end

  # private

  def get_hash(key, offset=nil,get_val=false)
    hash_value = 5381
    if offset
      hash_value += offset
      hash_value *= offset
    end

    key_array = key.split("")
    key_array.each_with_index do |char, index|
      hash_value = (hash_value << 17) + char.ord + index
    end
    offset = hash_value
    hash_value = hash_value % self.length

    if !@hash_collection[hash_value] || get_val
      # puts "offset is #{offset}, hash is #{hash_value}"
      # p @hash_collection[hash_value]
      offset = nil
      return hash_value
    elsif get_val
      return nil
    else
      # puts "offset is #{offset}, hash is #{hash_value}"
      return get_hash(key, offset)
    end
  end

end
