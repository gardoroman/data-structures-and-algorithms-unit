require_relative '../tree_list'

describe TreeList do
  let(:tree_list) {TreeList.new("m")}

  describe "#new" do
    it "creates new TreeList object" do
      expect(tree_list.class).to eq(TreeList)
    end

    it "has a length" do
      expect(tree_list.length).to eq(1)
    end
  end #end of new

  describe "#add" do
    it "adds an element to TreeList" do
      
    end
  end
end
