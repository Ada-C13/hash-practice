# frozen_string_literal: true

# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n)

# def grouped_anagrams(strings)
#   new_hash = Hash.new([])
#   strings.each.with_index { |word, i| new_hash[word.downcase.chars.sort.join] += [i] }
#   new_hash.map { |key, indexes| indexes.map { |i| strings[i] } }
# end

def grouped_anagrams(strings)

  new_hash = Hash.new()

  strings.each do |word|
    # calculate the hash key
    key_word = word.downcase.chars.sort.join

      if new_hash[key_word]  == nil
        new_hash[key_word] = []
      end
      array_value = new_hash[key_word]

    length = array_value.length
    array_value[length] = word
  end

  return new_hash.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
# def top_k_frequent_elements(list, k)
# raise NotImplementedError, "Method hasn't been implemented yet!"
input = [1, 1, 1, 2, 2, 3]
k = 2

def top_k_frequent_elements(list, k)
  list.group_by(&:itself).sort_by { |_, s| -s.length }.first(k).map(&:first)
end

top_k_frequent_elements(input, k)
# end

# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same
#   row, column or 3x3 subgrid
# Time Complexity: ?
# Space Complexity: ?
def valid_sudoku(_table)
  raise NotImplementedError, "Method hasn't been implemented yet!"
end
