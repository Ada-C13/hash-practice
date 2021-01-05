# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  hash = Hash.new
  strings.each do |element|
    key = element.chars.sort.join()
    groupedAnagrams = hash[key]
    if groupedAnagrams == nil
      hash[key] = []
      groupedAnagrams = hash[key]
    end
    groupedAnagrams << element
  end
  return hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(2n) -> O(n)
# Space Complexity:  O(n)
def top_k_frequent_elements(list, k)
  return nil if !list
  # intialze an empty hash
  ## iterate throught the list
  #chechk if the key  is in the hash,
  # if key is in the hash ++ value
  # otherwise add key  and value as 1 since it's first occurance
  # now the key(uniqe) and value(how many time the int_value) happend is in the hash,
  # my_hash.sort_by { |_, value| value }.each { |key, value| puts key } (iterate throught the hash, (hash.each {|key, value|}) )
  # before pushing the key into the initalized array, check to see if the length is less than k
  # if
  hash = Hash.new
  list.each do |int_value|
    if hash.key?(int_value)
      hash[key] = +1
    else
      hash[key] = 1
    end
  end
  kth_frequent_elements = []
  counter = 0 
  pervisou_value = 0
  hash.sort_by { |k, v| -v }.each do |key, value|
    if counter < k
      kth_frequent_elements << key
       if pervisou_value != value
        pervisou_value = value
        counter += 1
       end
    # end
    # if kth_frequent_elements.length < k
    #   kth_frequent_elements << key
    else
      break
    end
  end
  return kth_frequent_elements
end

# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same
#   row, column or 3x3 subgrid
# Time Complexity: ?
# Space Complexity: ?
def valid_sudoku(table)
  # seen_set = Set.new()
  # for i in 
end
