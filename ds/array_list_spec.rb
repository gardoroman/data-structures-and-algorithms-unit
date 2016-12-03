require_relative 'array_list'

describe ArrayList do
  let(:array_list) {ArrayList.new(5)}

  describe "#new" do
    it "creates a new ArrayList" do
      expect(array_list.class).to eq(ArrayList)
    end
  end

  describe "#length" do
    it "returns the size of the ArrayList" do
      expect(array_list.length).to eq(5)
    end
  end

  describe "#add" do

    let(:added_element) {array_list.add("added element")}

    it "adds an element to end of ArrayList" do
      expect(added_element).to eq("added element")
    end

    it "increases the size of the ArrayList" do
      expect { array_list.add("another element") }.to change { array_list.length }.by(1)
    end
  end

  describe "#set" do
    it "sets a value at the specified index" do
      expect(array_list.set(0,1)).to eq(1)
    end
  end

  describe "#get" do
    it "returns the value of element at specified index" do
      array_list.set(0,1)
      expect(array_list.get(0)).to eq(1)
    end
  end

  describe "#insert" do

    let(:inserted_element) {array_list.insert(3, "inserted element")}

    it "inserts an element at the desired index" do
      expect(inserted_element).to eq("inserted element")
    end

    it "increases the size of the ArrayList" do
      expect { array_list.insert(3, "insert another") }.to change { array_list.length }.by(1)
    end
  end

  describe "OutOfBoundsException" do
    it "raises error when index exceeds size" do
      expect { array_list.set(6, "x")}.to raise_exception(OutOfBoundsException)
    end

    it "raises error when retrieving a non-existing index" do
      expect { array_list.get(10)}.to raise_exception(OutOfBoundsException)
    end

    it "raises error when index less than Zero" do
      expect { array_list.get(-3)}.to raise_exception(OutOfBoundsException)
    end

    it "raises and error when inserting at index less than Zero" do
      expect { array_list.insert(-3, "too low")}.to raise_exception(OutOfBoundsException)
    end

    it "raises and error when inserting at index greater than length of ArrayList" do
      expect { array_list.insert(30, "too big")}.to raise_exception(OutOfBoundsException)
    end

  end

end
