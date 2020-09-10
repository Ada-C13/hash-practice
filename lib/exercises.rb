
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n2)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  hashOfArrays = {}
  strings.each do |string|
    key = string.split("")
    unless hashOfArrays.keys.include?(key)
    hashOfArrays.values do |array|
      internalArr = array[0].split("")
      count = 0 
      internalArr.each do |char|
        if !string.include?(char)
        count +=1
        end
      end 
      if count == internalArr.length
        array<< string
      end
    end
    end
  end 

  return hashOfArrays.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n2)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  numHash  = {}
  returnList = []
  list.each do |num|
    if numHash.keys.include?(num)
      numHash[num]+=1
    else
      numHash[num]=1
    end
  end

  numHash.sort.reverse

  numHash.keys.each do |num|
    if returnList.length < k
    returnList<< num 
    else
      return returnList
    end
  end

  return returnList

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
