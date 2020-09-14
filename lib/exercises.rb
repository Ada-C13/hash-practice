
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n) (n being size of array)
# Space Complexity: O(n)

def grouped_anagrams(strings)

  grouped_anagrams = Array.new()
  hash = Hash.new()

  strings.each do |word|
    separated = word.split("").sort!

    if !hash.key?(separated)
      hash[separated] = [word]
    else
      hash[separated] << word 
    end 
  end 

  hash.each do |key, value|
    grouped_anagrams << value
  end 
  
  return grouped_anagrams
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n log n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  to_me = Array.new
  hash = {}
  return to_me if k > list.size || list.nil? 

  list.each do |value|
    if !hash[value]
      hash[value] = 1
    else 
      hash[value] += 1
    end 
  end 

  organized = hash.sort_by {|k, value| -value}
    k.times do |i|
      to_me << organized[i][0]
    end 
    return to_me
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
