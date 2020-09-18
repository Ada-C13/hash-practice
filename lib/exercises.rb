
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: a lot
# Space Complexity: O(n)

def grouped_anagrams(strings)
  hash = {}

  strings.each do | string | 

   a_key = string.chars.sort

   if hash.key? (a_key)
     hash[a_key] << string 
   else
     hash[a_key] = [string]
   end
  end 

   arrayArrays = []
   hash.each do | key , value|
     arrayArrays << hash[key]
   end

   return arrayArrays 
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
# resource: https://stackoverflow.com/questions/4264133/descending-sort-by-value-of-a-hash-in-ruby
def top_k_frequent_elements(list, k)
  # Hash.new(0) sets default value for any key to 0, while {} sets nil
  hash = Hash.new(0)
  k_array = []

  return [] if list.empty?
  
  # populate the hash and count occurrence
  list.each do |num|
    hash[num] += 1
  end

  # set hash's values in descending order
  descending_hash = hash.sort_by {|key, value| -value}

  # populate the array with most common elements dictated by k
  k.times do |i|
    k_array << descending_hash[i][0]
  end

  return k_array
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
