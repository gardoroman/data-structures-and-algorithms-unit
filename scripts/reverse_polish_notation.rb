require_relative '../ds/stack'
require_relative '../ds/array_list'

# op = "5 1 2 + 4 * + 3 -"
def rpn(operation)
  rpn_stack = Stack.new
  tokens = parse_tokens(operation)
  puts tokens.to_s
  tokens.each do |token|
    if !is_operator?(token)
      puts "pushing token #{token}"
      rpn_stack.push(token)
    else
      val2 = rpn_stack.pop
      val1 = rpn_stack.pop
      rpn_stack.push(calculate(val1,val2, token))
    end # end of if
  end # end of each
  rpn_stack.pop
end

def is_operator?(token)
  token == "+" || token == "-" || token == "*" || token == "/"
end

def calculate(val1, val2, operator)
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

op = "5 1 2 + 4 * + 3 -"
op = "4 13 5 / +"
# op = "5 3 +"
puts rpn(op)
