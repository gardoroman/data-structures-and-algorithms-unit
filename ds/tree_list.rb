require_relative 'tree'

class TreeList

  attr_accessor :length, :index, :root, :element_list

  def initialize(node)
    @tree = Tree.new(node,2)
    @root = @tree.node
    @length = 1
    @index = 0
    @element_list = ArrayList.new
  end

  def add(element, comparison_node=nil)
    comparison_node = @root unless comparison_node
    position = compare(element, comparison_node)
    if !comparison_node.children.get(position)
      added_element = TreeNode.new(element, 2)
      @length += 1
      puts "setting #{element} at pos #{position} in return #{comparison_node}"
      return comparison_node.children.set(position, added_element)
    else
      add(element, comparison_node.children.get(position))
    end
    element
  end

  def view
    list
    @element_list
  end

  def index_of(value)
    depth_first_search(value, @root)
  end

  private

  attr_accessor :tree

  def compare(element, other)
    if element < other.value
      return 0
    elsif element > other.value
      return 1
    else
      return nil
    end
  end

  def list(node=nil)
    node = @root unless node
    left_child = node.children.get(0)
    right_child = node.children.get(1)
    list(left_child) if left_child
    @element_list.add(node)
    list(right_child) if right_child
  end

  def depth_first_search(value, node)
    return nil unless node
    if node.value == value
      puts "does it ever?"
      return index
    end
    @index += 1
    puts "node class is #{node.class}"
    left_child = node.children.get(0)
    right_child = node.children.get(1)
    puts "value is #{value} node val is #{right_child}"
    result = depth_first_search(value, left_child)
    return result if result
    result = depth_first_search(value, right_child)
    return result if result
    nil
  end


end
