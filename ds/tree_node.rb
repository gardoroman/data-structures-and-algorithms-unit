require_relative 'array_list'

class TreeNode

  attr_accessor :value, :children

  def initialize(value)
    @value = value
    @children = ArrayList.new
  end

  def add_child(child)
    @children.add(TreeNode.new(child))
  end

  def to_s
    value
  end
end
