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
      linked_list.add(first_node)
      expect(linked_list.add(middle_node)).to eq(linked_list.get(linked_list.length - 1))
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

    it "can set an element at beginning of list" do
      node = Node.new("New Node")
      expect(linked_list.set(0, node)).not_to eq(@head_node)
    end

    it "can set an element in the middle of the list" do
      replaced_node = linked_list.get(1)
      expect(linked_list.set(1, @new_node)).not_to eq(replaced_node)
    end

    it "can set an element at end of list" do
      node = Node.new("New Node")
      expect(linked_list.set(2, node)).not_to eq(@tail_node)
    end

    it "does not change size of list" do
      expect { linked_list.set(1, @new_node) }.to change { linked_list.length }.by(0)
    end

  end #end of set

  describe "#insert" do
    before(:each) do
      @head_node = linked_list.add(first_node)
      @middle_node = linked_list.add(middle_node)
      @last_node = linked_list.add(last_node)
      @inserted_node = Node.new("Inserted Node")
    end

    it "inserts an element in list" do
      expect(linked_list.insert(1,@inserted_node)).to eq(@inserted_node)
    end

    it "inserts an element beginning of list" do
      expect(linked_list.insert(0,@inserted_node)).to eq(@inserted_node)
    end

    it "updates first node when 0 index is updated" do
      linked_list.insert(0,@inserted_node)
      expect(linked_list.first).to eq(@inserted_node)
    end

    it "can insert an element at end of list" do
      last_position = linked_list.length - 1
      expect(linked_list.insert(last_position,@inserted_node)).to eq(@inserted_node)
    end

    it "shifts last node when inserting at last index" do
      last_position = linked_list.length - 1
      linked_list.insert(last_position,@inserted_node)
      expect(linked_list.last).to eq(@last_node)
    end

    it "increases size of list" do
      expect { linked_list.insert(1, @inserted_node) }.to change { linked_list.length }.by(1)
    end


  end #end of insert

  describe "OutOfBoundsException" do
    it "raises error when setting at index that exceeds length" do
      expect { linked_list.set(6, "too big")}.to raise_exception(OutOfBoundsException)
    end

    it "raises error when retrieving non-existent index" do
      expect { linked_list.get(10)}.to raise_exception(OutOfBoundsException)
    end

    it "raises error when inserting non-existing index" do
      expect { linked_list.insert(10, last_node)}.to raise_exception(OutOfBoundsException)
    end

    it "raises error when index less than Zero" do
      expect { linked_list.get(-3)}.to raise_exception(OutOfBoundsException)
    end

  end

  describe "ElementNotFound" do
    let(:empty_list) {LinkedList.new}
    it "raises error when accessing first node on empty array" do
      expect { empty_list.first}.to raise_exception(ElementNotFound)
    end

    it "raises error when accessing last node on empty array" do
      expect { empty_list.last}.to raise_exception(ElementNotFound)
    end

  end


end
