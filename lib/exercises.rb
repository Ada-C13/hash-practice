
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: o(n^2)
# Space Complexity: o(n) => created 1 new hash and 1 new array. It should be o(2n), but we can ignor the constant

def grouped_anagrams(strings)
  anagrams_hash = {}

  strings.each do |string|
    sorted_s = string.chars.sort.join
    if !anagrams_hash.has_key? (sorted_s)
      anagrams_hash[sorted_s] = [string]
    else # if the key does exist
      anagrams_hash[sorted_s] << string
    end
  end

  result = []
  anagrams_hash.each do |hash_word, array|
    result << array
  end 
  
  return result
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: o(nlogn) b/c of the sort_by method
# Space Complexity: o(n) b/c created 1 hash and 2 arrays
def top_k_frequent_elements(list, k)
  return [] if list.length == 0
  return [list[0]] if k == 1 && list == list.uniq
  hash = {}

  list.each do |number|
    if !hash[number]
      hash[number] = 1
    else
      hash[number] += 1
    end
  end

  dec_frequent = hash.sort_by {|k, v| v}.reverse

  result = []
  while result.length < k
    result << dec_frequent[result.length][0]
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
