
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n) n is the amount of strings given
# Space Complexity: O(n) each string is saved into a new hash

def grouped_anagrams(strings)
  return [] if strings.empty?
  numbered_letters = {}
  ('a'..'z').each_with_index { |l, i| numbered_letters[l] = i}

  possible_anagrams = {}

  strings.each do |string|
    value = 0
    string.each_char do |char|
      value += numbered_letters[char]
    end
    if possible_anagrams[value]
      possible_anagrams[value] << string 
    else
      possible_anagrams[value] = [string]
    end
  end

  return possible_anagrams.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n log n) n is the number of elements in list
# Space Complexity: O(n) 
def top_k_frequent_elements(list, k)
  return list if list.empty? || list.length == k
  count = {}
  
  list.each do |num|
      count[num] ? count[num] += 1 : count[num] = 1
  end
  
  sorted = count.sort_by { |k, v| -v }
  
  most_frequent = Array.new(k)
  k.times { |i| most_frequent[i] = sorted[i][0] } 
  
  return most_frequent
end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: ?
# Space Complexity: ?
def valid_sudoku(table)
  raise NotImplementedError, "Method hasn't been implemented yet!"
end
