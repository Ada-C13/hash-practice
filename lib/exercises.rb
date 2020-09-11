

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: o(n2) because I am iterating over the string and 
# I know Bytes is gonna iterate over it as well
# Space Complexity: 0(n)

def grouped_anagrams(strings)
  hash_ana = {}
  outerArray = []

  # The way I identify they are anagrams is using bytes to get the ASCII value of each char sum them, 
  # Then we know all the characters have the same letter on it.  
  strings.each do |string|
    if hash_ana[string.bytes.sum]
      hash_ana[string.bytes.sum].push(string)
    else
      hash_ana[string.bytes.sum] = [string]
    end
  end

  hash_ana.each do |key|
    outerArray << key[1]
  end

  return outerArray

end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: o(n)
# Space Complexity: o(1)
def top_k_frequent_elements(list, k)
  return [] if list.empty?

  count_hash = Hash.new(0)
  result = []

  list.each do |element| 
    count_hash[element] += 1 
  end

  max_array = count_hash.sort_by { |k, v| -v }

  (0...k).each do |i|
    result << max_array[i][0]
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

