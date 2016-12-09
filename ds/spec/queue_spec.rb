require_relative '../queue'

describe Queue do
  let(:queue) {Queue.new}
  describe "#new" do
    it "creates a new Queue" do
      expect(queue.class).to eq(Queue)
    end
  end

  describe "#enqueue" do
    it "adds an element to the queue" do
      expect(queue.enqueue("first")).to eq("first")
    end
  end

  describe "#dequeue" do
    it "removes first element from the queue" do
      queue.enqueue("first element")
      queue.enqueue("second element")
      expect(queue.dequeue).to eq("first element")
      expect(queue.peel).to eq("second element")
    end
  end

  describe "#peel" do
    it "returns first element to display only" do
      queue.enqueue("first")
      expect(queue.peel).to eq("first")
    end
  end

  describe "#empty?" do
    it "returns true if queue is empty" do
      expect(queue.empty?).to be true
    end

    it "returns flase if queue is not empty" do
      queue.enqueue("not empty")
      expect(queue.empty?).to be false
    end
  end


end
