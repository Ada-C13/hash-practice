
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: ?
# Space Complexity: ?

def grouped_anagrams(strings)
  hash = {}
  return [] if strings.empty?

  strings.each do |word|
    sorted = word.chars.sort
    if hash[sorted]
      hash[sorted] << word
    else
      hash[sorted] = [word]
    end
  end
  
  # output = []
  # hash.keys.each do |key|
  #   output << hash[key]
  # end

  # return output

  return hash.values


end

def is_anagram(string1, string2)
  return false if string1.length != string2.length

  letter_hash = {}
  
  string1.each_char do |letter|
    letter_hash[letter] = letter_hash[letter].nil? ? 1 : letter_hash[letter] += 1
  end

  string2.each_char do |letter|
    if letter_hash[letter]
      letter_hash[letter -= 1]
    else
      return false
    end
  end

  hash.keys.each do |key|
    if hash[key] != 0
      return false
    end
  end

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
