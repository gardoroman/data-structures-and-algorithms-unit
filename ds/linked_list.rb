require_relative 'node'
require_relative 'ds_exceptions' #ElementNotFound

class LinkedList
  attr_accessor :length, :first, :last

  def initialize
    @length = 0
  end

  def add(node)
    if self.length == 0
      @first = node
      @last = node
    else
      @last.next_node = node
      @last = node
    end
    self.length += 1
    node
  end

  def first
    raise ElementNotFound unless self.length > 0
    @first
  end

  def last
    raise ElementNotFound unless self.length > 0
    @last
  end

  def get(position)
    return nil unless self.length > 0
    node = iterate(position)
    if node
      return node
    else
      raise ElementNotFound
    end
  end

  def set(position, element)
    position = validate_position(position)
    previous_node = get(position - 1)
    current_node = previous_node.next_node
    after_node = current_node.next_node
    element.next_node = after_node
    previous_node.next_node = element
  end

  def insert(position, element)
    position = validate_position(position)
    previous_node = get(position - 1)
    current_node = previous_node.next_node
    after_node = current_node
    element.next_node = after_node
    previous_node.next_node = element
  end

  private

  def iterate(position)
    raise OutOfBoundsException unless valid_range?(position)
    current_node = self.first
    index = 0
    while index < position
      # yield (current_node)
      current_node = current_node.next_node
      index += 1
    end
    current_node
  end

  def valid_range?(index)
    index >= 0 && index < self.length
  end

  def validate_position(position)
    if position < 0
      raise OutOfBoundsException
    elif position == 0
      return 1
    else
      return position
    end
  end
end

#runner code

first_node = Node.new('First')
middle_node = Node.new('Middle')
last_node = Node.new('Last')
ll = LinkedList.new
ll.add(first_node)
ll.add(middle_node)

ll.add(last_node)

# ll.each { |i| puts i.element}