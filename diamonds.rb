# Write a method that displays a 4-pointed diamond in an n x n gird, where n is
# an odd integer that is supplied as an argument to the method. You may assume
# that the argument will always be an odd integer.

=begin

PROBLEM NOTES:

display a diamond made of n rows asterisks
the first and last row contain a single asterisk
the middle row contains n asterisks

n will always be an odd number

PROMBLEM: format asterisk row
  given a number and a grid size
  return a row of (number) asterisks
    padded on the left by ((grid size - number) / 2) spaces
  Ex: star_row(1, 3) # => " *"
  EX: star_row(3, 7) # => "  ***"

ALGORITHM:

STAR ROW(number, grid_size)
  concatenate
   1. string of ((grid size - number) / 2) spaces
      with
   2. string of (number) asterisks
  return the resulting string

DIAMOND(grid_size)
output each row of the diamond using two loops
  1. first loop increases number of asterisks each row by 2
      starting at 1 ending at grid_size
  2. second loop decreases number of asterisks each row
      starting at (grid_size - 2) and ending at 1

  1. & 2. each loop will output the result of calling the STAR ROW method
          passing in the number of asterisks needed in the current row
          and the grid size

IMLEMENTATION NOTES #1:
STAR ROW
  use string multiplication on ' ' and '*' strings
  concatenate using String#+

DIAMOND
  initialize stars_per_row to 1
  use Kernel#loop for both loops
    first loop 1 up to grid_size
    second loop (grid_size - 2) down to 1

IMLEMENTATION NOTES #2:
STAR ROW
  create sapces and stars strings first as an array, then use Array#join
  concatenate the two stirngs using String#concat

DIAMOND
  initialzie stars_per_row variable to 1
  use a while loop for each loop
=end

def star_row(number_of_stars, grid_size)
  (' ' * ((grid_size - number_of_stars) / 2)) + ('*' * number_of_stars)
end

def display_diamond(grid_size)
  stars_per_row = 1
  loop do
    puts star_row(stars_per_row, grid_size)
    break if stars_per_row >= grid_size
    stars_per_row += 2
  end
  loop do
    stars_per_row -= 2
    break if stars_per_row < 1
    puts star_row(stars_per_row, grid_size)
  end
end

def star_row(number_of_stars, grid_size)
  stars = Array.new(number_of_stars, '*').join
  spaces = Array.new(((grid_size - number_of_stars) / 2), ' ').join
  spaces.concat(stars)
end

def display_diamond(grid_size)
  stars_per_row = 1
  while stars_per_row < grid_size
    puts star_row(stars_per_row, grid_size)
    stars_per_row += 2
  end
  while stars_per_row >= 1
    puts star_row(stars_per_row, grid_size)
    stars_per_row -= 2
  end
end

display_diamond(1)
display_diamond(3)
display_diamond(9)
display_diamond(11)

# p star_row(1, 3)
# p star_row(3, 3)
# p star_row(1, 3)

# p star_row(1, 9)
# p star_row(3, 9)
# p star_row(5, 9)
# p star_row(7, 9)
# p star_row(9, 9)
