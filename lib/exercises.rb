
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n2)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  return [] if strings.length == 0
  result =  {}
  strings.each do |word|
    char = word.chars.sort.join
    result[char] ||= []
    result[char] << word
  end
  return result.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  return [] if list.length == 0
  frequency = {}
  # number as key 
  # frequency as value

  list.each do |num|
    if frequency[num].nil?
      frequency[num] = 1
    else
      frequency[num] += 1
    end
  end

  result = []
  
  frequency.keys.each do |num|
    if result.length < k
      result << num
    else
      return result
    end
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
