require_relative '../graph_node'

og = GraphNode.new("OG")
#
# gn1 = GraphNode.new("GN1")
# gn2 = GraphNode.new("GN2")
# gn3 = GraphNode.new("GN3")

og.add_edge("g1")
og.add_edge("g2")
og.add_edge("g3")

og.nodes.each {|e| puts e.value}
g1 = og.nodes.get(0)
p og.exists?(g1)
