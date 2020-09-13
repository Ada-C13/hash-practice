
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n * m) where n is word and m is char 
# Space Complexity: O(n)

def grouped_anagrams(strings)
  result = []
  return result if strings.empty?

  word_hash = {}
  strings.each do |word|
    char_hash = {}
    word.each_char do |char|
      if char_hash[char]
        char_hash[char] += 1
      else
        char_hash[char] = 1
      end
    end
    if word_hash[char_hash]
      word_hash[char_hash] << word
    else
      word_hash[char_hash] = [ word ]
    end
  end
  return word_hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(nlogn)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  result = []
  return result if list.empty? || k > list.length 
  hash = {}
  list.each do |value|
    if hash[value]
      hash[value] += 1
    else
      hash[value] = 1
    end
  end

  sorted_frequncies = hash.sort_by {|k, v| -v}
  k.times do |i|
    result << sorted_frequncies[i][0]
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
