
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n * m) where m is the num words and n is longest num of characters in the words
# Space Complexity: O(n)

def grouped_anagrams(strings)
  return [] if strings.empty?
  hash_of_letter_groups_and_words = {}
  strings.each do |word|
    sorted_word = word.chars.sort
    if hash_of_letter_groups_and_words.keys.include?(sorted_word)
      hash_of_letter_groups_and_words[sorted_word].push(word)
    else
      hash_of_letter_groups_and_words[sorted_word] = [word]
    end
  end
  return hash_of_letter_groups_and_words.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O (n log n) 
# Space Complexity: O (n)
def top_k_frequent_elements(list, k)
  return [] if list.empty?
  hash_occurences = {}
  list.each do |num|
    if hash_occurences.keys.include?(num)
      hash_occurences[num] += 1
    else
      hash_occurences[num] = 1
    end
  end
  
  sorted_array = hash_occurences.sort_by{|k,v| -v}

  k_most_frequent_elements = []
  
  k.times do |i|
    k_most_frequent_elements.push(sorted_array[i][0])
  end

  return k_most_frequent_elements
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
