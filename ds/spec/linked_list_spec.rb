require_relative '../linked_list'

describe LinkedList do
  let(:linked_list) {LinkedList.new}
  let(:first_node) {Node.new("First")}
  let(:middle_node) {Node.new("Middle")}
  let(:last_node) {Node.new("Last")}

  describe "#new" do
    it "creates a new LinkedList" do
      expect(linked_list.class).to eq(LinkedList)
    end
  end # end of new

  describe "#length" do
    it "returns the length of LinkedList" do

    end
  end # end of length

  describe "#add" do

    it "adds first element to list" do
      expect(linked_list.add(first_node)).to eq(first_node)
    end

    it "add a node changes the length property" do
      linked_list.add(first_node)
      expect(linked_list.length).to eq(1)
    end

    it "adds next element to end of list" do
      expect(linked_list.add(middle_node)).to eq(middle_node)
    end

    it "increases the size of the ArrayList" do
      linked_list.add(first_node)
      expect { linked_list.add(middle_node) }.to change { linked_list.length }.by(1)
    end

    context "nodes are added" do
      before(:each) do
        @head_node = linked_list.add(first_node)
      end

      it "makes first property equal to only node" do
        expect(linked_list.first).to eq(@head_node)
      end

      it "makes the only node equal to the last node" do
        expect(linked_list.last).to eq(@head_node)
      end

      it "keeps the first node as the head_node" do
        linked_list.add(middle_node)
        expect(linked_list.first).to eq(@head_node)
      end

      it "updates the last node" do
        linked_list.add(middle_node)
        expect(linked_list.last).to eq(middle_node)
      end

      it "continues to update the last node" do
        linked_list.add(middle_node)
        linked_list.add(last_node)
        expect(linked_list.last).to eq(last_node)
      end

    end

  end # end of add

  describe "#get" do
    before(:each) do
      @head_node = linked_list.add(first_node)
      @middle_node = linked_list.add(middle_node)
      @last_node = linked_list.add(last_node)
    end

    it "retreives the element at the index 0" do
      expect(linked_list.get(0)).to eq(@head_node)
    end

    it "retreives the element at the index 0" do
      expect(linked_list.get(1)).to eq(@middle_node)
    end

    it "retreives the element at the index 2" do
      expect(linked_list.get(2)).to eq(@last_node)
    end

  end #end of get

  describe "#set" do
    
  end

end
