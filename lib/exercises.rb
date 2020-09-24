
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n^2) or O(m * n) where m is the number of words and n is the characters
# Space Complexity: O(n) where n is the number of words in the array

def grouped_anagrams(strings)
  hash = {}
  return [] if strings.empty?

  strings.each do |word|
    sorted = word.chars.sort
    if hash[sorted]
      hash[sorted] << word
    else
      hash[sorted] = [word]
    end
  end

  return hash.values
end


# This method will return the k most common elements
# in the case of a tie it will select the first occurring element.
# Time Complexity: O (n log n) due to sort_by / quick sort - best case. Worst case is O(n^2) if the data is already ordered
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  return [] if list.empty?
  hash = {}

  list.each do |num|
    if hash[num]
      hash[num] =+ 1
    else
      hash[num] = 1
    end
  end

  sorted_hash = hash.sort_by {|key, value| -value}

  answer = []
  
  k.times do |i|
    answer << sorted_hash[i][0]
  end

  return answer

end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: ?
# Space Complexity: ?

def complete_sudoku
  return {
    1 => 1,
    2 => 1,
    3 => 1,
    4 => 1,
    5 => 1,
    6 => 1,
    7 => 1,
    8 => 1,
    9 => 1
  }
end


def valid_sudoku(table)

  # rows = {}
  # cols = {}
  # mini_square = {}

  # i = 0 # current row
  # j = 0 # current column
  # until i > 9
  #   until j > 9
  #     box = table[i][j];
  #     j += 1
  #   end
  #   i += 1
  # end
end


