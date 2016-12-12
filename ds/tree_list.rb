require_relative 'tree'

class TreeList

attr_accessor :length, :index

  def initialize(node)
    @tree = Tree.new(node)
    @length = 1
  end

  def add(element)
    
  end

  private

  attr_accessor :tree
end
