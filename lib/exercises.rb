
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(1)
# Space Complexity: o(n)

def grouped_anagrams(strings)
  # raise NotImplementedError, "Method hasn't been implemented yet!"
  return [] if strings.empty?
    # list = ["eat", "tea", "tan", "ate", "nat", "bat"]
    # answer = grouped_anagrams(list)
    # expected_answer = [
    #   ["ate","eat","tea"],
    #   ["nat","tan"],
    #   ["bat"]
    # ]
    hash = Hash.new([])
    strings.each.with_index do |element, i| 
      hash[element.downcase.chars.sort.join] += [i] 
    end
    # p hash
    results = hash.map do |key, values| 
      values.map do |i| 
        strings[i]
      end
    end

    return results
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  # list = [1,1,1,2,2,3]
  # k = 2 take top 2
  # output:[1,2]
  return [] if list.empty?
  hash = {}
  list.each do |element| 
    hash[element] ? hash[element] += 1 : hash[element] = 1
  end

  # get top k highest values and return keys
  #sorth values 

  # if all values are eaqul to 1 return all keys
  return hash.keys.take(k) if hash.values.all? { |v| v == 1 }
  short_hash_values = hash.values.sort 
  top_k_freq_values = short_hash_values.last(k)
  results = top_k_freq_values.map do |element|
    hash.key(element)
  end
  return results
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
