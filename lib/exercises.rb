
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n log n)
# Space Complexity: O(n)
def grouped_anagrams(strings)
  return [] if strings.empty?

  groups = {}

  strings.each do |string|
    sorted = string.chars.sort # makes this time efficiency of O(n log n)

    if groups[sorted]
      groups[sorted] << string
    else
      groups[sorted] = [string]
    end
  end

  return groups.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n log n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  return [] if list.empty?

  count = {}

  list.each do |item|
    if count[item]
      count[item] += 1
    else
      count[item] = 1
    end
  end

  count.sort_by { |k, v| -v } # makes this time efficiency of O(n log n)
  count_arr = count.to_a

  ret_arr = []
  k.times do |i|
    ret_arr << count_arr[i][0]
  end

  return ret_arr
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
