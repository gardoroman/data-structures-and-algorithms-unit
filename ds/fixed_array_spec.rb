require_relative 'fixed_array'

describe FixedArray do
  let(:fixed_array) {FixedArray.new(5)}

  describe "#new" do
    it "creates a new FixedArray object" do
      expect(fixed_array.class).to eq(FixedArray)
    end
  end

  describe "#length" do
    it "returns the length of the array" do
      expect(fixed_array.length).to eq(5)
    end
  end

  describe "#set" do
    it "sets a value at the specified index" do
      expect(fixed_array.set(0,1)).to eq(1)
    end
  end

  describe "#get" do
    it "returns the value of element at specified index" do
      fixed_array.set(0,1)
      expect(fixed_array.get(0)).to eq(1)
    end
  end

  describe "OutOfBoundsException" do
    it "raises error when index exceeds size" do
      expect { fixed_array.set(6, "too big")}.to raise_exception(OutOfBoundsException)
    end

    it "raises error retrieving a non-existing index" do
      expect { fixed_array.get(10)}.to raise_exception(OutOfBoundsException)
    end

    it "raises error when index less than Zero" do
      expect { fixed_array.get(-3)}.to raise_exception(OutOfBoundsException)
    end

  end

end
