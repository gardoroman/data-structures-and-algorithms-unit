require_relative 'tree'

class Map

  attr_accessor :mapped_items, :length

  def initialize
    @mapped_items = Tree.new("InternalNode")
  end

  def length
    @mapped_items.node.children.length
  end

  def get(key)
    item = internal_search(key)
    return item.children.get(0).value if item
    nil
  end

  def set(key, value)
    match = internal_search(key)
    if !match
      key = @mapped_items.node.add_child(key)
      v = key.add_child(value)
    else
      match.children.set(0,TreeNode.new(value))
    end

    value

  end

  def remove_key(key)
    @mapped_items.node.children.delete_at(find_index(key))
  end


  def has_key?(key)
    @mapped_items.node.children.each do |item|
      if item.value == key
        return true
      end
    end
  end

  def iterate
    @mapped_items.node.children.each do |child|
      yield child.value, child.children.get(0).value
    end
  end

  private

  def internal_search(key)
    @mapped_items.node.children.each do |item|
      if item.value == key
        return item
      end
    end
  end

  def find_index(key)
    count = 0
    @mapped_items.node.children.each do |item|
      if item.value == key
        return count
      end
      count += 1
    end
  end

end
