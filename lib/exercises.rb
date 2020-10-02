
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(m + n + nlog(n))
# Space Complexity: O(n)

def grouped_anagrams(strings)
  grouped = {}
  strings.each do |e|
    current_sorted = e.split("").sort.join("") 
    if !grouped["#{current_sorted}"]
       grouped["#{current_sorted}"] = [e]
    else
      grouped["#{current_sorted}"] << e
    end 
  end 
  return grouped.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n log(n))
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  if list.length == 0 
    return []
  end 
  nums = {}
  list.each do |num|
    if !nums[num]
      nums[num] = 1
    else
      nums[num] += 1
    end
  end 

  sorted = nums.sort_by {|k, v| -v}
  top_k = []
  k.times do |k|
    top_k << sorted[k][0]
  end 
  return top_k
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



    #if col + 1 % 3 == 0  && row + 1 % 3 == 0 -> check square 