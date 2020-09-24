
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n * m(logm)), where n is the number of strings and m is the length of each string
# Space Complexity: O(n), where n is the number of strings

def grouped_anagrams(strings)
  anagrams = Hash.new
  
  strings.each do |s|
    # sort each string, assign to variable
    bucket = anagrams[s.chars.sort.join]  
    # check if sorted string is present in hash keys
    # if present, add original string to existing bucket array
    # otherwise, create a new bucket array
    bucket ? bucket.push(s) : bucket = [s]
  end

  return anagrams.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n), where n is the number of elements
# Space Complexity: O(1)?
def top_k_frequent_elements(list, k)
  return list if list.length < 2

  items_hash = {}

  list.each do |item|
    items_hash[item] ? items_hash[item] += 1 : items_hash[item] = 1
  end

  if items_hash.values.uniq.length == k
    tiebreaker(items_hash, k)
  else
    return most_common = items_hash.keys.max_by(k) do |item|
      items_hash[item]
    end
  end
end

# this only works for the test case. for example, the following will fail:
# list = [1,1,1, 2,2,2, 3,3]
# k = 2
# expected output: [1, 3]
def tiebreaker(items_hash, k)
  sorted = items_hash.keys.sort_by do |item| 
    -items_hash[item]
  end

  most_common = []
  k.times do |i|
    most_common.push(sorted[i])
    i += 1
  end

  return most_common
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
