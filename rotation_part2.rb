# Write a method that can rotate the last n digits of a number.
# For examle:

# rotate_rightmost_digits(735291, 4) == 732915

# Note that rotating just 1 digit results in the orignal number being returned.
# You may use the rotate_array method from the previous exercise if you want.
# You may assume that n is always a positive integer.

=begin
PROBLEM NOTES:
 rotate_rightmost_digits(735291, 4) == 732915
 left part: 73  right part: 5291
 left part: 73  right part: 291 swap digit: 5
 left part: 73  right part: 2915
 732915

ALGORITHM:
  1 seperate number into a left part and a right part (of n digits)
  2 seperate the first digit of the right part to swap digit
  3 concatenate swap digit to the end of the right part
  4 concatenate left part with right part for final return value

IMPLEMENTATION NOTES #1:
  1 use Integer#divmod to seperate the last n digits
  2 use Integer#divmod again to seperate the first digit
  3 add first digit to the (right part * 10)
  4 add the right part to (left part * 10**n)

IMPLEMENTATION NOTES #2:
  1 convert number to string
  1 swap digit has index (num_strin.length - n)
  1 left part is a slice from index 0 to swap_index (exclusive)
  1 right part is a slice from (swap_index +1) to end of string
  2 swap digit can be selected at swap_index
  3 & 4 concatenate all three slices and convert back to integer
=end

def rotate_rightmost_digits1(number, n)
  left_digits, right_digits = number.divmod(10**n)
  swap_digit, right_digits = right_digits.divmod(10**(n - 1))
  right_digits = right_digits * 10 + swap_digit
  left_digits * (10**n) + right_digits
end

def rotate_rightmost_digits2(number, n)
  num_string = number.to_s
  swap_index = num_string.size - n
  left_digits = num_string[0...swap_index]
  right_digits = num_string[(swap_index + 1)..-1]
  swap_digit = num_string[swap_index]
  (left_digits + right_digits + swap_digit).to_i
end

# Example:

p rotate_rightmost_digits1(735291, 1) == 735291
p rotate_rightmost_digits1(735291, 2) == 735219
p rotate_rightmost_digits1(735291, 3) == 735912
p rotate_rightmost_digits1(735291, 4) == 732915
p rotate_rightmost_digits1(735291, 5) == 752913
p rotate_rightmost_digits1(735291, 6) == 352917
puts ""
p rotate_rightmost_digits2(735291, 1) == 735291
p rotate_rightmost_digits2(735291, 2) == 735219
p rotate_rightmost_digits2(735291, 3) == 735912
p rotate_rightmost_digits2(735291, 4) == 732915
p rotate_rightmost_digits2(735291, 5) == 752913
p rotate_rightmost_digits2(735291, 6) == 352917
