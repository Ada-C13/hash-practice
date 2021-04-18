
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: n*m*1 (n = number of strings, m = number of characters in each string, 1 for the lookups on the hash)
# Space Complexity: O(n)?

def grouped_anagrams(strings)
  grouped_anagrams = {}

  strings.each do |string|
    char_map = {}

    string.each_char do |char|
      char_map[char] ? char_map[char] += 1 : char_map[char] = 1
    end

    if grouped_anagrams[char_map]
      grouped_anagrams[char_map].append(string)
    else
      grouped_anagrams[char_map] = [string]
    end
  end

  return grouped_anagrams.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)
  return [] if list.empty?

  hash = {}

  list.each do |element|
    hash[element] ? hash[element] += 1 : hash[element] = 1
  end

  frequent_list = []
  answer_length = 0

  highest_freq = hash.values.max

  while answer_length < k
    hash.each do |element, count|
      if count == highest_freq
        frequent_list << element
        answer_length += 1
      end

      break if answer_length == k
    end

    highest_freq -= 1
  end

  return frequent_list
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
