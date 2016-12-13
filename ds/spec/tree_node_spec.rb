require_relative '../tree_node'

describe TreeNode do

  let(:tree_node) {TreeNode.new("Tree Node")}

  describe "#new" do
    it "creates a new TreeNode" do
      expect(tree_node.class).to eq(TreeNode)
    end

    it "has a value" do
      expect(tree_node.value).to eq("Tree Node")
    end

  end # end of new

  describe "#add_child" do
    before(:each) do
      @first_child= tree_node.add_child("first child")
      @second_child= tree_node.add_child("second child")
    end

    it "can add a collection of child Tree Nodes" do
      expect(tree_node.add_child("new child")).to eq("new child")
    end

    it "can check the length of the collection of children" do
      expect(tree_node.children.length).to eq(2)
    end

    it "can display the contents of the children collection" do
      expect(tree_node.children.to_s).to eq("['first child','second child']")
    end

  end # end of add

end
