
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n) where n is the array's size.
# Space Complexity: O(n)

def grouped_anagrams(strings) #input is an array, output array of arrays 
  grouped_anagrams = Array.new()
  hash_table = Hash.new()

  strings.each do |word|
    letters = word.split("").sort!  

    if hash_table.key?(letters)
      hash_table[letters] << word
    else 
      hash_table[letters] = [word]
    end 
  end 

  hash_table.each do |k, v|
    grouped_anagrams << v 
  end 

  return grouped_anagrams
  
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n) where n is the array's size (list).
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  len = list.length 
  max_frequency = 0 
  return list if k == len
  return []  if list.empty? 

  result = []
  hash_map = Hash.new(0)

  list.each do |number|
    hash_map[number] += 1 
  end 

  sorted_hash_by_value = hash_map.sort_by {|k, v| -v}  #array of arrays [[key, value]] sorted descending 

  i = 0 
  while i < k do 
    result << sorted_hash_by_value[i][0]
    i += 1 
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

#grouped_anagrams(strings)

  #should I create multple hashes for each word ? 
  #I need to go through each letter of the string 
  #current string 
  #split the string 
  #sort the array of letters 
  #check if the hash has array of letter 
  #if yes, add the current string to the value of the hash table, 
  #if not, add the array of letter as key and an empty array as it value and include the letter you are adding


# hash_table =
#{
#   ["a", "e", "t"] => ["ate", "eat", "tea"],
# }

#hash_table.key?(["a", "t", "e"]) -> false 
#hash_table.key?(["a", "e", "t"]) -> true 


