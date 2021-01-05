
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n) - n is number of words in the array
# Space Complexity: O(n) - n is number of words in the array
def grouped_anagrams(strings)
  return [] if strings.empty?
  
  hash = {}
  
  strings.each do |word|
    sorted_word = word.chars.sort.join
    if hash[sorted_word]
      hash[sorted_word] << word
    else
      hash[sorted_word] = []
      hash[sorted_word] << word
    end
  end
  
  return hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n) - n is length of list
# Space Complexity: O(n) - n is the length of the list
def top_k_frequent_elements(list, k)
  return [] if list.empty?
  return list if list.size == 1
  return [list[0]] if k == 1
  
  hash = {}
  list.each do |num|
    if hash[num]
      hash[num] += 1
    else
      hash[num] = 1
    end
  end
  
  sorted_nums = hash.sort_by{|num,count| count}.reverse
  
  most_freq = []
  i = 0
  k.times do
    most_freq << sorted_nums[i][0]
    i+=1
  end

  return most_freq  
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
