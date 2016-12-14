require_relative '../graph_node'

describe GraphNode do
  let(:graph_node) {GraphNode.new("First")}
  describe "#new" do
    it "creates a new GraphNode" do
      expect(graph_node.class).to eq(GraphNode)
    end
  end #end of #new

  describe "#value" do
    it "has a value" do
      expect(graph_node.value).to eq("First")
    end
  end

  describe "#add_edge" do
    it "can add a new node to its collection" do
      # new_node = GraphNode.new("New")
      expect(graph_node.add_edge("New")).to eq(graph_node.nodes.get(0))
      expect {graph_node.add_edge("Another")}.to change {graph_node.nodes.length}.by(1)
    end
  end

  describe "#exists?" do
    it "can determine if a node exists downstream" do
      existing_node = graph_node.add_edge("existing")
      expect(graph_node.exists?(existing_node)).to be true
    end

    it "returns nil if node does not exist" do
      non_existing = GraphNode.new("not downstream")
      expect(graph_node.exists?(non_existing)).to be nil
    end
  end

end #end main
