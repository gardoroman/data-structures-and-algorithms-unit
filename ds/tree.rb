require_relative 'tree_node'

class Tree

  attr_accessor :node
  def initialize(node,size=0)
    @node = TreeNode.new(node,size)
  end

  def search(value, start_node=nil)
    if start_node && start_node.value == value
      return true
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
