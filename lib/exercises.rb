
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n) n being the quantity of strings 
# Space Complexity: O(1) bc we are only creating one new hash

def grouped_anagrams(strings)
  letter_hash = {}

  strings.each do |word|
    if letter_hash[word.split("").sort] == nil 
      letter_hash[word.split("").sort] = [word]
    else 
      letter_hash[word.split("").sort] << word
    end  
  end 

  return letter_hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n log n)
# Space Complexity: O(n)
# not sure why this one is failing a test bc it returns the correct response in repl??
def top_k_frequent_elements(list, k)
  return [] if list == []
  hash = {}

  list.each do |num|
    if hash[num]
      hash[num] += 1
    else
      hash[num] = 1
    end
  end

  sorted = hash.sort_by{|num, frequency| -frequency} 

  result = []
  k.times do |key, value|
    result << sorted[key][0]
  end 

  return result
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
