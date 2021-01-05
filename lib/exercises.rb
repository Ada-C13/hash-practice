
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(m * n) 
# Space Complexity: O(n)

def grouped_anagrams(strings)
  anagram_hash = {}

  strings.each do |word|
    letters = word.chars.sort
    sorted_letters = letters.join

    if !anagram_hash.has_key?(sorted_letters)
      anagram_hash[sorted_letters] = [word]
    else anagram_hash[sorted_letters] << word
    end
  end

  return anagram_hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(m * n)
# Space Complexity: O(n)
# https://stackoverflow.com/questions/4264133/descending-sort-by-value-of-a-hash-in-ruby
# https://courses.cs.washington.edu/courses/cse373/18au/files/slides/lecture13.pdf

def top_k_frequent_elements(list, k)
  if list.empty? 
    return list 
  end

  element_frequency = {}
  
  list.each do |num|
    if element_frequency[num]
      element_frequency[num] += 1
    else
      element_frequency[num] = 1
    end
  end

  frequent_elements = []

  k.times do
    max_frequency = 0
    max_frequent_elements = nil

    element_frequency.each do |key, value|
      if value > max_frequency
        max_frequent_elements = key
        max_frequency = value
      end
    end

    frequent_elements << max_frequent_elements
    element_frequency[max_frequent_elements] = 0
  end

  return frequent_elements
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
