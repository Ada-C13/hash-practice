
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n log n)
# Space Complexity: O(n)

def grouped_anagrams(strings)
# create an empty hash to store your word
  hash = {}

  #loop through strings
  strings.each do |word|
    key = word.chars.sort.join
    #check if key is in the hash, push the word into the hash
    #else, set the key as the word
    if hash.key?(key)
      hash[key] << word
    else
      hash[key] = [word]
    end
  end
    #create a new result array
    #loop through hash to get the keys
    result = []
    hash.each do | key, value |
      result << hash[key]
    end
    
    #return the array
    return result
  end #end function


# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# list = [1,1,1,1,2]
#outcome = 1
# Time Complexity: O(n log n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  #check if the length of the list is zero, return empty array
  if list.length == 0
    return []
  end
  #create new hash here
  hash = Hash.new(0)
  #loop through array 
  list.each do |num|
    hash[num] += 1
  end
  #got help with this result line via Martha
  #you want to sort the hash by number value and frequency
  #descending order
  result = hash.sort_by{|num, frequency| -frequency} 
  #create an empty array to hold your final result
  final_result = []
  #based on the number of common elements you want, that's how many times you'll loop thorugh
  #push the result into the final result
  #return the final result
  k.times do |i|
    final_result << result[i][0]
  end
  return final_result
end #end function


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
