
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: 0(1)
# Space Complexity: 0(n)

def grouped_anagrams(strings)
  return [] if strings.empty?
  return [strings] if strings.size == 1

  hash1 = {}

  # this is the original str
  strings.each do |str|
  
    # this is the sorted str
    word = str.split("").sort.join("")
  
    # check hash for word 
    # if not exist, set str as hash value
    if hash1[word].nil? 
      hash1[word] = [str]
    else
      # or shovel str as hash value
      hash1[word] << str
    end
  
  end
  return hash1.values
end


# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: 0(1)
# Space Complexity: 0(n)
def top_k_frequent_elements(list, k)
  return [] if list.empty?

  hash1 = {}

  # create hash from list where same elements(key) are tallied(value)
  list.each do |num|
    if hash1[num]
      hash1[num] += 1
    else 
      hash1[num] = 1
    end
  
  end
  # sort hash by value - descending
  sorted = hash1.sort_by { |key, value| value }.reverse
  answer = []
  k.times do |index|
    answer << sorted[index].first
  end
  
  return answer

  end # closing end for top_k_frequent_elements method


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
