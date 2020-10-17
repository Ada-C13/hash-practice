
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n)

# hash function that assigns each letter a value
def alphabet_keys()
  alphabet = "abcdefghijklmnopqrstuvwxyz".split('')
  alphabet_keys = {}
  alphabet.length.times do |i|
    alphabet_keys[alphabet[i]] = i + 1
  end

  return alphabet_keys
end

def grouped_anagrams(strings)
  return [] if strings == []

  alphabet_keys = alphabet_keys()
  string_keys = {}

  # iterate through each string
  strings.each do |str|
    key = 0
    # use alphabet_keys to assign each word a key by adding together values of each letter in the word
    str.split('').each do |l|
      key += alphabet_keys[l]
    end
    # if key exists, add word to that key
    if string_keys[key]
      string_keys[key].push(str)
    else # otherwise create a new key-value pair
      string_keys[key] = [str]
    end
  end

  grouped_anagrams = []
  string_keys.each do |k, v|
    grouped_anagrams.push(v)
  end
  
  return grouped_anagrams
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  return [] if list.empty?
  frequency = {}
  list.each do |i|
    frequency[i] ? (frequency[i] += 1) : (frequency[i] = 1)
  end

  nums = []
  unique = list.uniq
  max = frequency.values.max

  until max == 0 || nums.length == k
    unique.each do |i|
      break if nums.length == k
      if frequency[i] == max
        nums << i
      end
    end
    max -= 1
  end

  return nums
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
