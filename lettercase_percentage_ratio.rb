# Write a method that takes a string, and then returns a hash that contains 3
# entries: one represents the percentage of characters in the string that are
# lowercase letters, one the percentage of characters that are uppercase
# letters, and one the percentage of characters that are neither.

# You may assume the string will contain at least one character.

=begin
PROBLEM NOTES:
  take a string
  return a hash of percentages of the string that are
    lowercase letters
    uppercase letters
    neither

ALGORITHM:
  1 initialize a hash
  2 count the number of lowercase letters in string
    count the number of uppercase letters in the string
    the neither count is equal to the length - (upper_count + lower_count)

  3 multiply both counts by 100.0 then divide by string.length
  4 assign the resulting percentages to the corresponding key in percentages hash
  5 return the percentages hash

IMPLEMENTATION #1:
  1 empty hash
  2 use String#count('a-z') for lowercase_count
  2 use String#count('A-Z') for uppercase_count

IMPLEMENTATION #2:
  1 initialize hash keys with values of zero
  2 use String#each_char to count the upper and lowecase letters
    use a case statement to increment each hash key
  3 transform the hash values to percentages * 100.0 / string.length
=end

def letter_percentages1(string)
  percentages = {}
  percentages[:lowercase] = string.count('a-z').fdiv(string.length) * 100
  percentages[:uppercase] = string.count('A-Z').fdiv(string.length) * 100
  percentages[:neither] = 100 - percentages[:uppercase] - percentages[:lowercase]
  percentages
end

def letter_percentages2(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  string.each_char do |char|
    case char
    when 'a'..'z'
      counts[:lowercase] += 1
    when 'A'..'Z'
      counts[:uppercase] += 1
    else
      counts[:neither] += 1
    end
  end
  counts.keys.each { |key| counts[key] *= 100.0 / string.length }
  counts
end

p letter_percentages1('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages1('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages1('123') == { lowercase: 0, uppercase: 0, neither: 100 }
puts ""
p letter_percentages2('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages2('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages2('123') == { lowercase: 0, uppercase: 0, neither: 100 }
