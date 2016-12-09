require_relative 'node'
require_relative 'ds_exceptions' #ElementNotFound

class LinkedList
  attr_accessor :length, :first, :last

  def initialize
    @length = 0
  end

  def add(element)
    node = Node.new(element)
    if self.length == 0
      @first = node
      @last = node
    else
      @last.next_node = node
      @last = node
    end
    self.length += 1
    node.element
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
    get_internal_node(position).element
  end

  def set(position, element)
    element = Node.new(element)
    raise OutOfBoundsException unless valid_range?(position)
    if position == 0
      if self.length == 0
        add(element)
      else
        element.next_node = self.first.next_node
        @first = element
      end
    else
      position = validate_position(position)
      previous_node = get_internal_node(position - 1)
      current_node = previous_node.next_node
      after_node = current_node.next_node
      element.next_node = after_node
      previous_node.next_node = element
      @last = element if element.next_node == nil
    end
    element.element
  end

  def insert(position, element)
    element = Node.new(element)
    raise OutOfBoundsException unless valid_range?(position)
    if position == 0
      if self.length == 0
        add(element)
      else
        element.next_node = self.first
        @first = element
      end
    else
      position = validate_position(position)
      previous_node = get_internal_node(position - 1)
      current_node = previous_node.next_node
      after_node = current_node
      element.next_node = after_node
      previous_node.next_node = element
      @last = element if element.next_node == nil
    end
    self.length += 1
    element.element
  end

  private

  def get_internal_node(position)
    raise OutOfBoundsException unless valid_range?(position)
    return nil unless self.length > 0
    element = iterate(position)
    if element
      return element
    else
      raise ElementNotFound
    end
  end

  def iterate(position)
    raise OutOfBoundsException unless valid_range?(position)
    current_node = first
    index = 0
    while index < position
      # yield (current_node)
      current_node = current_node.next_node
      index += 1
    end
    current_node
  end

  def valid_range?(index)
    return true if index == 0
    index >= 0 && index < self.length
  end

  def validate_position(position)
    if position < 0
      raise OutOfBoundsException
    elif position == 0
      return position += 1
    else
      return position
    end
  end
end
