require_relative '../map'

describe Map do
  let(:my_map) {Map.new}

  describe "::new" do
    it "creates a new Map object" do
      expect(my_map.class).to eq(Map)
    end
  end #end of ::new

  describe "#set" do
    it "sets key/value pair in Map" do
      expect(my_map.set("a", "first item")).to eq("first item")
    end

    it "can overwrite value of a key" do
      my_map.set("b", "Old Key")
      expect(my_map.set("b", "New Key")).to eq(my_map.get("b"))
    end
  end

  describe "#get" do
    it "retrieves the value at the specified key" do
      my_map.set("a", "a key")
      expect(my_map.get("a")).to eq("a key")
    end

    it "returns nil if key not found" do
      my_map.set("a", "a key")
      expect(my_map.get("b")).to be nil
    end
  end

  describe "has_key?" do
    it "returns true if key is in Map" do
      my_map.set("a", "real key")
      expect(my_map.has_key?("a")).to be true
    end

    it "returns nil if key is not in Map" do
      my_map.set("a", "real key")
      expect(my_map.has_key?("b")).to be nil
    end
  end
end
