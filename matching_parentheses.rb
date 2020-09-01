# Write a method that takes a string as argument, and returns true if all
# parentheses in the string are properly balanced, false otherwise. To be
# properly balanced, parentheses must occur in matching '(' and ')' pairs.

=begin
PROBLEM NOTES:
  given a string
  check that any '(' is follwed by a matching ')'
  a ')' can not come first

ALGORITHM:
  1 use a stack to track open parentheses
  2 parse through each character in string
    a if a '(' is found add it to the stack
    b if a ')' is found either remove one '(' from the stack
      or return false
  3 return true if the stack is empty

IMPLEMENTATION NOTES #1:
  1 initialize stack as empty string
  2 use String#each_char to parse through array
    a use String#concat to add '(' to stack
    b if stack is empty return false
      use stack = stack[0..-2] to update stack
  3 implicitly return String#empty?

IMPLEMENTATION NOTES #2:
  1 initialize stack as empty array
  2 use a while loop
    a use Array#push to add '(' to satack
    b use Array#pop
      return false if nil is returned
  3 implicitly return Array#empty?
=end

def balanced_1?(string)
  stack = ''
  string.each_char do |char|
    stack.concat(char) if char == '('
    if char == ')'
      return false if stack.empty?
      stack = stack[0..-2]
    end
  end
  stack.empty?
end

def balanced_2?(string)
  index = 0
  stack = []
  while index < string.length
    char = string[index]
    if char == '('
      stack.push(char)
    elsif char == ')'
      return false unless stack.pop
    end
    index += 1
  end
  stack.empty?
end

# Examples:

p balanced_1?('What (is) this?') == true
p balanced_1?('What is) this?') == false
p balanced_1?('What (is this?') == false
p balanced_1?('((What) (is this))?') == true
p balanced_1?('((What)) (is this))?') == false
p balanced_1?('Hey!') == true
p balanced_1?(')Hey!(') == false
p balanced_1?('What ((is))) up(') == false
puts ''
p balanced_2?('What (is) this?') == true
p balanced_2?('What is) this?') == false
p balanced_2?('What (is this?') == false
p balanced_2?('((What) (is this))?') == true
p balanced_2?('((What)) (is this))?') == false
p balanced_2?('Hey!') == true
p balanced_2?(')Hey!(') == false
p balanced_2?('What ((is))) up(') == false
