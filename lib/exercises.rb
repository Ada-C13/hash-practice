
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n)
def grouped_anagrams(strings)
  # create an anagrams hash of arrays
  anagrams = {}
  # for each string, split the characters and sort them
  # join the characers, and test the hash keys
  # if the key already exists add it to the array of that key
  # if not create one
  strings.each do |word| 
    sorted_word = word.split(//).sort.join
    if anagrams[sorted_word]
      anagrams[sorted_word] << word
    else
      anagrams[sorted_word] = [word]
    end
  end
  
  # return the arrays
  anagrams.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  # create a counter hash for the numbers
  counter = {}
  # go through the list of numbers
  # test the hash keys, if it is not there, add it with a number 1 value
  # otherwise increment the value by 1
  list.each do |num|
    if !counter[num]
      counter[num] = 1
    else
      counter[num] += 1
    end
  end

  # list.each do |element|
  #   counts[element] ||= 0
  #   counts[element] += 1
  # end

  # find the K max counts
  highest_counts = counter.values.max(k)
  # return the values of those keys
  most_frequent = []
  highest_counts.each do |n|
    most_frequent << counter.key(n)
    counter.delete(counter.key(n))
  end
  return most_frequent
end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: ?
# Space Complexity: ?
def get_valid_digit_count
  return {
    1 => 1,
    2 => 1,
    3 => 1,
    4 => 1,
    5 => 1,
    6 => 1,
    7 => 1,
    8 => 1,
    9 => 1,
  }
end

def check_subgrid(table, subgrid)
  current_row = subgrid[0]
  current_col = subgrid[1]
  digit_count = get_valid_digit_count
  begin

  while current_row < subgrid[0] + 3
    while current_col < subgrid[1] + 3
      if table[current_row][current_col] =~ /\d/
        digit_count[ table[current_row][current_col].to_i ] -= 1
      end

      current_col += 1
    end
    current_col = subgrid[1]
    current_row += 1
  end
  rescue NoMethodError
    return false
  end

  return !digit_count.values.any? { |value| value < 0 }
end

def valid_sudoku(table)
  row_count = get_valid_digit_count
  col_count = get_valid_digit_count

  begin 
    (0...table.length).each do |i|
      row_count = get_valid_digit_count
      col_count = get_valid_digit_count
      (0...table.length).each do |j|
        if table[i][j] =~ /\d/
          row_count[ table[i][j].to_i  ] -= 1
        end

        if table[j][i] =~ /\d/
          col_count[ table [j][i].to_i ] -= 1
        end
      end
      if row_count.values.any? { |value| value < 0 }
        return false
      end
      if col_count.values.any? { |value| value < 0 }

        return false
      end
    end

  
  rescue  NoMethodError # if the table has something not 0-9
    return false
  end

  [[0,0], [0,3], [0,6],
   [3,0], [3,3], [3,6],
   [6,0], [6,3], [6,6]].each do |grid|
    if !check_subgrid(table, grid)
      puts "failing on #{grid}"
      return false
    end
  end

  return true
end
