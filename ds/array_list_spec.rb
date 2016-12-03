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
    before(:each) do
      @added_element = array_list.add("added element")
    end
    # let(:added_element) {array_list.add("added element")}

    it "adds an element to end of ArrayList" do
      expect(@added_element).to eq("added element")
    end

    it "increases the size of the ArrayList" do
      expect(array_list.length).to eq(6)
    end
  end

end
