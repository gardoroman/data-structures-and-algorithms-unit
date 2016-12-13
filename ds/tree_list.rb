require_relative 'tree'

class TreeList

attr_accessor :length, :index, :root

  def initialize(node)
    @tree = Tree.new(node,2)
    @root = @tree.node
    @length = 1
  end

  # elements must be ordered
  # each level can be at most a length of 2
  # determine whether it is < or >
  # determine where it belongs in the list
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

  def compare(element, other)
    if element < other.value
      return 0
    elsif element > other.value
      return 1
    else
      return nil
    end
  end

  private

  attr_accessor :tree


  # start at the root if
  def order_elements(start_node, element)
    if @length < 4

    end

  end

end
