
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(1)

def grouped_anagrams(strings)
  string_hashmap = {}
  strings.each do |string|
    if string_hashmap[grouped_anagrams_helper(string)]
      string_hashmap[grouped_anagrams_helper(string)] << string
    else
      string_hashmap[grouped_anagrams_helper(string)] = []
      string_hashmap[grouped_anagrams_helper(string)] << string
    end
  end
  return string_hashmap.values
end

def grouped_anagrams_helper(string)
  return string.chars.sort.join
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n^2) in worst case because of the sorting to be done
# Space Complexity: O(1)
def top_k_frequent_elements(list, k)
  # build hashmap
  num_hash = {}
  list.each do |num|
    if num_hash[num]
      num_hash[num] += 1
    else
      num_hash[num] = 1
    end
  end

  # convert hashmap to array
  array_num_hash = num_hash.to_a

  # sort by occurences
  sorted_array_num_hash = array_num_hash.sort_by {|num| -num[1]}

  # sorted elements only
  sorted_numbers = sorted_array_num_hash.map{|num| num[0]}

  # slice sorted array by k elements
  return sorted_numbers.slice(0, k)
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
