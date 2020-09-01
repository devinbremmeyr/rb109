=begin
PROBLEM NOTES:
compute the nth Fibonacci number non-recursively (proceduraly)

F(1) = 1
F(2) = 1
F(n) = F(n-1) + F(n-2) where n > 2

Ex: F(4) = F(3) + F(2) => F(2) + F(1) + 1 => 1 + 1 + 1 => 3

ALGORITHM:
  given integer n

  1 initialize two integer variables to 1
      current_fib_number
      previous_fib_number
  2 iterate a loop (n - 2) times
    a assign the value of current_fib_number to swap_number
    b assign current_fib_number the result of previous_fib_number + current_fib_number
    c assign the value of swap_number to previoius_fib_number
  3 return current_fib_number

  Example:
  Fib(3) (1, 1) => (2, 1)
  Fib(4) (1, 1) => (2, 1) => (3, 2)

IMPLEMENTATION NOTES #1:
  use Integer#upto method for the loop
    starting at 3.upto(n)

IMPLEMENTATOIN NOTES #2:
  store the current and previous fib numbers in a two item array
  use a while loop for the loop
=end

def fibonacci1(n)
  current_fib_number = 1
  previous_fib_number = 1
  3.upto(n) do
    swap_number = current_fib_number
    current_fib_number += previous_fib_number
    previous_fib_number = swap_number
  end
  current_fib_number
end

def fibonacci2(n)
  fib_numbers = [1, 1]
  fib_index = 2
  while fib_index < n
    fib_numbers << fib_numbers.sum
    fib_numbers.shift
    fib_index += 1
  end
  fib_numbers.last
end

p fibonacci1(1) == 1
p fibonacci1(2) == 1
p fibonacci1(3) == 2
p fibonacci1(4) == 3
p fibonacci1(5) == 5
p fibonacci1(20) == 6765
p fibonacci1(100) == 354224848179261915075
p fibonacci1(100_001) % 10**19 == 8285979669707537501
puts ""
p fibonacci2(1) == 1
p fibonacci2(2) == 1
p fibonacci2(3) == 2
p fibonacci2(4) == 3
p fibonacci2(5) == 5
p fibonacci2(20) == 6765
p fibonacci2(100) == 354224848179261915075
p fibonacci2(100_001) % 10**19 == 8285979669707537501
