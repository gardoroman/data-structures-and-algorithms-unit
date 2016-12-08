require_relative '../ds/stack'
require_relative '../ds/array_list'


def rpn(operation)
  rpn_stack = Stack.new
  tokens = parse_tokens(operation)
  output = ""
  counter = 0
  answer = nil
  tokens.each do |token|
    if !is_operator?(token)
      rpn_stack.push(token)
    else
      until rpn_stack.empty? || counter > 50 do
        val2 = rpn_stack.empty? ? nil : rpn_stack.pop
        # val1 = rpn_stack.pop
        val1 = rpn_stack.empty? ? nil : rpn_stack.pop
        if val1 != nil && val2 != nil
          answer = rpn_stack.push(operation(val1, val2, token))
        end
        counter +=1
      end
    end
  end
  rpn_stack.pop
end

def is_operator?(token)
  token == "+" || token == "-" || token == "*" || token == "/" || token == "(" || token == ")"
end

def operation(val1, val2, operator)
  case operator
  when "+"
    return val1.to_i + val2.to_i
  when "-"
    return val1.to_i - val2.to_i
  when "*"
    return val1.to_i * val2.to_i
  when "/"
    return val1.to_i / val2.to_i
  end
end

def parse_tokens(operation)
  operation = operation.gsub(/[^\S]/,",")
  token_array = ArrayList.new
  index = 0
  position = 0
  while index < operation.count(",")
    comma = operation.index(",",position)
    token_array.add(operation.slice(position,comma - position))
    position = comma + 1
    index += 1
  end
  token_array.add(operation.slice(position,operation.length - position))
  token_array
end

op = "5 1 2 + 4 × + 3 −"
# op = "5 3 +"
puts rpn(op)
