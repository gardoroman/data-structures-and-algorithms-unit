require_relative '../node'

describe Node do
  let(:head_node) {Node.new("Head")}
  let(:tail_node) {Node.new("Tail")}

  describe "#new" do
    it "creates a new Node" do
      expect(head_node.class).to eq(Node)
    end
  end

  describe "#element" do
    it "returns the value of the node" do
      expect(head_node.element).to eq("Head")
    end
  end

  describe "#next_node" do
    it "returns nil if a pointer is not assinged" do
      expect(head_node.next_node).to be_nil
    end

    it "points to a node object" do
      head_node.next_node = tail_node
      expect(head_node.next_node.class).to eq(Node)
    end
  end
end


# LinkedList#new
# LinkedList#insert_first(element)
# LinkedList#remove_first(element)
# LinkedList#insert_last(element)
# LinkedList#remove_last(element)
# LinkedList#get(index) | use negative indices
# LinkedList#set(index, element) | use negative indices
# LinkedList#insert(index, element) | use negative indices
# LinkedList#size
