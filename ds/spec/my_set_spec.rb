require_relative '../my_set'

describe MySet do
  let(:main_set) {MySet.new}

  before(:each) do
    @set_1 = MySet.new
    @set_2 = MySet.new
    @sub_set_1 = MySet.new
    @set_1.add("a")
    @set_1.add("b")
    @set_1.add("c")
    @set_1.add("d")
    @set_2.add("c")
    @set_2.add("d")
    @set_2.add("e")
    @sub_set_1.add("a")
    @sub_set_1.add("c")
  end

  describe "::new" do
    it "creates a new MySet object" do
      expect(main_set.class).to eq(MySet)
    end
  end #new

  describe "#add" do
    it "adds element to set" do
      expect(main_set.add("a")).to eq("a")
      expect(main_set.size).to eq(1)
    end

    it "will not add duplicate elements" do
      main_set.add("a")
      main_set.add("a")
      expect(main_set.size).to eq(1)
    end
  end #add

  describe "size" do
    it "returns size of set" do
      main_set.add("a")
      main_set.add("b")
      main_set.add("c")
      main_set.add("d")
      main_set.add("a")
      main_set.add("a")
      expect(main_set.size).to eq(4)
    end
  end #size

  describe "#contains?" do
    let(:value) {main_set.add("value")}

    it "returns true if element in Set" do
      expect(main_set.contains?(value)).to be true
    end

    it "returns nil if element not found in Set" do
      expect(main_set.contains?("non value")).to be nil
    end
  end #contains

  describe "#remove" do
    it "removes element if it exists" do
      main_set.add("a")
      main_set.add("b")
      main_set.remove("b")
      expect(main_set.contains?("b")).to be nil
    end
  end # remove

  describe "#union" do
    let(:union_set) {  @set_1.union(@set_2) }
    it "returns a combined set" do
      expect(union_set.to_s).to eq("['a','b','c','d','e']")
    end
    it "does not alter the first set" do
      expect(@set_1.to_s).to eq("['a','b','c','d']")
    end
    it "does not alter the second set" do
      expect(@set_2.to_s).to eq("['c','d','e']")
    end
  end # end union

  describe "#intersection" do

    let(:intersected_set) {  @set_1.intersection(@set_2) }

    it "returns elements in common between Sets" do
      expect(intersected_set.to_s).to eq("['c','d']")
    end
  end

  describe "#difference" do
    let(:difference_set) {  @set_1.difference(@set_2) }

    it "returns elements unique to the set" do
      expect(difference_set.to_s).to eq("['a','b']")
    end
  end

  describe "#subset?" do
    it "returns true if subset of Set" do
      expect(@set_1.subset?(@sub_set_1)).to be true
    end
    it "returns false if not subset of Set" do
      expect(@set_1.subset?(@set_2)).to be false
    end
  end


end #main
