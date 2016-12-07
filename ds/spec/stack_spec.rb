require_relative '../stack'

describe Stack do
  let(:stack) {Stack.new}
  before(:each) do
    @a = stack.push("a")
    @b = stack.push("b")
    @c = stack.push("c")
  end

  describe "#new" do
    it "creates a new Stack" do
      expect(stack.class).to eq(Stack)
    end
  end

  describe "#push" do
    it "adds an element to the stack" do
      expect(stack.push("d")).to eq("d")
    end
  end

  describe "#pop" do
    it "removes the top element off of stack" do
      expect(stack.pop).to eq(@c)
      expect(stack.pop).to eq(@b)
    end
  end

  describe "#top" do
    it "returns the first element on the stack" do
      expect(stack.top).to eq(@c)
    end
  end

  describe "#empty?" do
    it "returns true if stack is empty" do
      empty_stack = Stack.new
      expect(empty_stack.empty?).to eq(true)
    end

    it "returns false if stack has elements" do
      expect(stack.empty?).to eq(false)
    end
  end
end
