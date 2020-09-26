
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n^2) - Nested loop
# Space Complexity: O(n)

def grouped_anagrams(strings)
  anagram_hash = {}

  strings.each do |str|
    bucket = anagram_hash.keys.find do |b|
      unique_chars = b.chars.sort.join
      unique_chars == str.chars.sort.join
    end

    if !bucket.nil?
      anagram_hash[bucket] << str
    else
      anagram_hash[str] = [str]
    end
  end
  return anagram_hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  elements_hash = {}

  list.each do |element|
    if elements_hash[element]
      elements_hash[element] += 1
    else
      elements_hash[element] = 1
    end
  end

  #this doesn't pass tests — instead of grabbing the FIRST most frequent, it grabs the most frequent, period. I couldn't figure out how to do the other way
  return elements_hash.keys.max_by(k) { |key| elements_hash[key] }
end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: ?
# Space Complexity: ?
def valid_sudoku(table)
  # raise NotImplementedError, "Method hasn't been implemented yet!"
end
