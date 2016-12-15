require_relative 'array_list'

class GraphNode

  attr_accessor :value, :nodes

  def initialize(value)
    @value = value
    @nodes = ArrayList.new
  end

  def add_edge(edge)
    @nodes.add(GraphNode.new(edge))
  end

  def exists?(value)
    @nodes.each do |node|
      return true if node == value
    end
  end
end
