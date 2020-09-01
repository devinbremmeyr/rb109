# A featured number (something unique to this exercise) is an odd number that is
# a multiple of 7, and whose digits occur exactly once each. So, for example,
# 49 is a featured number, but 98 is not (it is not odd), 97 is not
# (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument,
# and returns the next featured number that is greater than the argument.
# Issue an error message if there is no next featured number.

=begin
PROBLEM NOTES:
  Featured number:
  # => odd number
  # => multiple of 7
  # => digits occur exactly once each

  input integer
  output integer (next featured number greater than input)

  Issue an error message if there is no next featured number
  greater than 9_999_999_999 there are no more featured numbers
  
  PROBLEM: UNIQUE DIGITS?
    return false if a number contains the same digit more than once (e.g. 99)
    otherwise return true

ALGORITHM:
  UNIQUE DIGITS?
    1 convert number to a string
    2 parse through each digit in the number string
       a compare each digit to the rest of the digits in the string
         if any digits match return false
    3 otherwise return true

  FEATURED
  1 increment number by one until it is a multiple of 7 and odd

  2 loop
    a if number has UNIQUE DIGITS
        return number
    b increment number by 14
    c break if number is greater than 9_999_999_999
  3 return "No featured number greater than number exists"

IMPLEMENTATION NOTES #1:
  UNIQUE DIGITS?
    2 use Enumerable#each_with_index
      a Array#include?
  FEATURED
    1 use Kernel#loop
    2 use Kernel#loop
    3 error message as implicit return

IMPLEMENTATION NOTES #2:
  UNIQUE DIGITS?
    2 use regex /(\d).*\1/

  FEATURED
    1 use until loop
    2 use a while loop
    3 implicitly return number
=end

def unique_digits?(number)
  digits_arr = number.to_s.split('')
  digits_arr.each_with_index do |digit, i|
    return false if digits_arr[(i + 1)..-1].include?(digit)
  end
  true
end

def featured1(number)
  loop do
    number += 1
    break if number % 7 == 0 && number.odd?
  end
  loop do
    return number if unique_digits?(number)
    number += 14
    break if number > 9_876_543_201
  end
  'No featured number greater than given number exists'
end

def featured2(number)
  number += 1
  number += 1 until number % 7 == 0 && number.odd?
  while number.to_s.match?(/(\d).*\1/)
    number += 14
    if number > 9_876_543_201
      return 'No featured number greater than given number exists'
    end
  end
  number
end

# p unique_digits?(11) == false
# p unique_digits?(1001) == false
# p unique_digits?(1029) == true
p featured1(12) == 21
p featured1(20) == 21
p featured1(21) == 35
p featured1(997) == 1029
p featured1(1029) == 1043
p featured1(999_999) == 1_023_547
p featured1(999_999_987) == 1_023_456_987
p featured1(9_999_999_999) # -> There is no possible number that fulfills those requirements
puts ""
p featured2(12) == 21
p featured2(20) == 21
p featured2(21) == 35
p featured2(997) == 1029
p featured2(1029) == 1043
p featured2(999_999) == 1_023_547
p featured2(999_999_987) == 1_023_456_987
p featured2(9_999_999_999) # -> There is no possible number that fulfills those requirements
