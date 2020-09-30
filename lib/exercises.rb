
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  hash = {}

  strings.each do |word|
    letter_grouping = word.split('').sort().join()

    if !hash[letter_grouping]
      hash[letter_grouping] = []
    end 
    
    hash[letter_grouping] << word
  end 

  return hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  return [] if list.empty?

  counts_hash = {}

  list.each do |number|
    if !counts_hash[number]
      counts_hash[number] = 1 
    else
      counts_hash[number] = counts_hash[number] + 1
    end
  end

  length_to_num_hash = {}

  counts_hash.keys.each do |number|
    if !length_to_num_hash[counts_hash[number]]
      length_to_num_hash[counts_hash[number]] = []
    end
    length_to_num_hash[counts_hash[number]] << number
  end

  result_length = k
  result = []
  most_freq_num = length_to_num_hash.keys.max

  while result_length > 0 && most_freq_num != nil && most_freq_num >= 0
    if length_to_num_hash[most_freq_num]
      length_to_num_hash[most_freq_num].each do |num|
        result << num
        result_length -= 1
        break if result_length <= 0
      end
    end
    most_freq_num -= 1
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
