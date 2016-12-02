describe ArrayList do
  let(:array_list) {ArrayList.new(5)}

  describe "#size" do
    it "returns the length of the array" do
      expect(fixed_array.size).to eq(5)
    end
  end
end
