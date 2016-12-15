require_relative '../my_hash'

describe MyHash do
  let(:some_hash) {MyHash.new(50)}

  describe "::new" do
    it "creates new hash Object" do
      expect(some_hash.class).to eq(MyHash)
    end
  end #new

  describe "#set" do
    it "sets a value in the hash" do
      expect(some_hash.set("carrots", 1.5)).to eq("carrots")
    end
  end #set

  describe "#get" do
    it "retrieves a value based on its key" do
      some_hash.set("key","value")
      expect(some_hash.get("key")).to eq("value")
    end

    it "retrieves nil if value not found" do
      expect(some_hash.get("non-key")).to be nil
    end
  end #get

  describe "#has_key?" do
    it "returns true if value exists" do
      some_hash.set("key", "key exists")
      expect(some_hash.has_key?("key")).to be true
    end
    it "returns true nil if key not found" do
      expect(some_hash.has_key?("non-key")).to be nil
    end
  end #has_key?

  describe "#remove" do
    it "removes specified key" do
      some_hash.set("key", "removed value")
      some_hash.remove("key")
      expect(some_hash.has_key?("key")).to be nil
    end
  end

end
