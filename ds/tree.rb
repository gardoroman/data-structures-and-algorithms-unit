require_relative 'tree_node'

class Tree

  attr_accessor :node
  def initialize(node)
    @node = TreeNode.new(node)
  end

  def search(value, start_node=nil)
    if start_node && start_node.value == value
      return start_node
    elsif !start_node
      start_node = node unless start_node
    end
    start_node.children.each do |child|
      result = search(value, child)
      return result if result
    end
    # end
    return nil
  end
end
