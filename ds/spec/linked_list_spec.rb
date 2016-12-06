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

    it "increases size of ArrayList" do
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

      it "makes only node equal to last node" do
        expect(linked_list.last).to eq(@head_node)
      end

      it "keeps first node as head_node" do
        linked_list.add(middle_node)
        expect(linked_list.first).to eq(@head_node)
      end

      it "updates last node" do
        linked_list.add(middle_node)
        expect(linked_list.last).to eq(middle_node)
      end

      it "continues to update last node" do
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

    it "retreives element at index 0" do
      expect(linked_list.get(0)).to eq(@head_node)
    end

    it "retreives element at index 0" do
      expect(linked_list.get(1)).to eq(@middle_node)
    end

    it "retreives element at index 2" do
      expect(linked_list.get(2)).to eq(@last_node)
    end

  end #end of get

  describe "#set" do
    before(:each) do
      @head_node = linked_list.add(first_node)
      @middle_node = linked_list.add(middle_node)
      @last_node = linked_list.add(last_node)
      @new_node = Node.new("New Node")
    end

    it "sets an element at an existing index" do
      expect(linked_list.set(1, @new_node)).to eq(@new_node)
    end

    it "does not return replaced node" do
      replaced_node = linked_list.get(1)
      # @new_node = Node.new("New Node")
      expect(linked_list.set(1, @new_node)).not_to eq(replaced_node)
    end

    it "does not change size of list" do
      expect { linked_list.set(1, @new_node) }.to change { linked_list.length }.by(0)
    end

    it "can set an element at end of list" do

    end

    it "can set an element at beginning of list" do

    end

  end #end of set

  describe "#insert" do
    before(:each) do
      @head_node = linked_list.add(first_node)
      @middle_node = linked_list.add(middle_node)
      @last_node = linked_list.add(last_node)
      @new_node = Node.new("New Node")
    end

    it "inserts an element in list" do
      expect(linked_list.insert(1,@new_node)).to eq(@new_node)
    end

    it "can insert an element at end of list" do

    end

    it "can insert an element at beginning of list" do

    end

    it "increases size of list" do

    end


  end #end of insert

  # todo code error tests

end
