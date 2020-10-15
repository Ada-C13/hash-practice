
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n * m)
# Space Complexity: O(n)

def grouped_anagrams(strings)
  words = {} 
  
  while !strings.empty? 
    i, word_to_compare = 0, strings[0] 
    words[word_to_compare] = []

    while i < strings.length 
      if permutation(word_to_compare, strings[i])
        words[word_to_compare].push(strings[i])
        strings.delete_at(i) 
        i -= 1
      end
      i += 1 
    end
  end

  return words.values
end

def permutation(str1, str2)
  return true if str1.empty? && str2.empty?
  return false if str1.nil? || str2.nil?
  return false if str1.empty? || str2.empty?

  hash = {}

  str1.each_char do |char|
    hash[char] ? hash[char] += 1 : hash[char] = 1
  end

  str2.each_char do |char|
    hash[char] ? hash[char] -= 1 : false
  end

  return hash.values.all? { |value| value == 0 }
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)
  raise NotImplementedError, "Method hasn't been implemented yet!"
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
