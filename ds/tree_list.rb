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
      # puts "setting #{element} at pos #{position} in return #{comparison_node}"
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

  # returns depth first index
  def index_of(value)
    @index = 0
    depth_first_search(value, @root)
  end

  # returns ordinal index
  def ordered_index(value)
    @index = 0
    ordered_search(value, @root)
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
      return index
    end
    @index += 1
    left_child = node.children.get(0)
    right_child = node.children.get(1)
    result = depth_first_search(value, left_child)
    return result if result
    result = depth_first_search(value, right_child)
    return result if result
  end

  def ordered_search(value, node)
    return nil unless node

    left_child = node.children.get(0)
    if left_child
      result = ordered_search(value, left_child)
      return result if result
    end

    return index if node.value == value
    @index += 1

    right_child = node.children.get(1)
    if right_child
      result = ordered_search(value, right_child)
      return result if result
    end

    nil
  end

end
