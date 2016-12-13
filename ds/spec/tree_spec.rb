require_relative '../tree'

describe Tree do
  let(:tree) {Tree.new("body")}

  before(:each) do
    @first_div = tree.node.add_child("div")
    @second_div= tree.node.add_child("div")
    @third_div= tree.node.add_child("div")
    @first_p = @second_div.add_child("p")
    @second_p = @second_div.add_child("p")
    @only_b = @second_p.add_child("b")
  end

  describe "#new" do
    it "initializes new Tree object" do
      expect(tree.class).to eq(Tree)
    end

    it "has a root TreeNode" do
      expect(tree.node.class).to eq(TreeNode)
    end

    it "has a root TreeNode with a value" do
      expect(tree.node.value).to eq("body")
    end
  end # end of new

  describe "#search" do
    it "can search the tree for a specific node value" do
      expect(tree.search("b")).to be true
    end

    it "will return nil if not found" do
      expect(tree.search("not found")).to be nil
    end

  end # end o search

end
