
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n) - I'm looping through each letter of each word in the array
# Space Complexity: O(n) - I'm creating a new hash which contains all input elements

# option 1, Nested hash with keys as hashes of letters, values as arrays of words from that letters
def grouped_anagrams(strings)
  # edge cases
  return [] if strings.empty?
  return [[strings[0]]] if strings.size == 1
  # a hash is going to have hashes with letters as a key, and array of words
  # containing those letters as values
  anagrams_storage = {}
  strings.each do |word|
    # create a hash with letters as keys and a number of times it appears in that word as values
    letters = {}
    word.chars.each do |char|
      if letters[char]
        letters[char] += 1
      else
        letters[char] = 1
      end
    end
    # we freeze the hash as a key because it's recommended not to have mutable data structures as keys
    letters = letters.freeze
    # check if there is a hash equal to this newly created one.
    # checks key-value pairs, not their order
    if !anagrams_storage[letters]
      anagrams_storage[letters] = Array.new
      anagrams_storage[letters] << word
    else
      anagrams_storage[letters] << word
    end
  end
  # as a result we have 
  # { {"t"=>1,"a"=>1,"n"=>1} => ["tan", "nat", "ant"], "b"=>1,"a"=>1,"t"=>1} => ["bat"] }
  return anagrams_storage.values
end


# Time Complexity: O(n) - I'm looping through each letter of each word in the array
# Space Complexity: O(n) - I'm creating a new hash which contains all input elements

# option 2 renamed for grouped_anagrams_version2, 
# Nested hash with keys as arrays 26 letters long, values as arrays of words from that letters
def grouped_anagrams_version2(strings)
  # edge cases
  return [] if strings.empty?
  return [[strings[0]]] if strings.size == 1
  # new array has the same number of elements as the input array
  # each inner array has 25 elements, by the number of letter in the English alphabet
  anagrams_storage = {}
  strings.each do |word|
    letters = Array.new(26, 0)
    word.chars.each do |char|
      # get an Integer ordinal of a letter
      letters[char.ord - 97] += 1
    end

  # we freeze the array as a key because it's recommended not to have mutable data structures as keys
  letters = letters.freeze
  # check if there is a hash equal to this newly created one.
  # checks key-value pairs, not their order
    if !anagrams_storage[letters]
      anagrams_storage[letters] = Array.new
      anagrams_storage[letters] << word
    else
      anagrams_storage[letters] << word
    end
  end
  # as a result we have 
  # { [1,0,0,0...all 26 elements] => ["tan", "nat", "ant"] }
  return anagrams_storage.values
end






# option 1 with time complexity O(n log n), renamed for top_k_frequent_elements_version2
# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n log n)
# Space Complexity: O(n)
def top_k_frequent_elements_version2(list, k)
  # edge cases
  return list if list.empty? || list.size == 1

  occurances_counter = {}
  list.each do |digit|
    if occurances_counter[digit]
      occurances_counter[digit] += 1
    else
      occurances_counter[digit] = 1
    end
  end
  # occurances_counter looks like this for input [1,1,2,2,2]: {1=>2, 2=>3}
  # create an array out of this hash, sort it by values and return keys of k elements
  sorted_occurances = occurances_counter.to_a.sort_by{ |pair| pair[1]}
  number_pairs = sorted_occurances.slice(sorted_occurances.length - k, k)
  result = number_pairs.map do |pair|
    pair[0]
  end
  return result
end

# option 2 with time complexity O(n)
# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  # edge cases
  return list if list.empty? || list.size == 1

  occurances_counter = {}
  list.each do |digit|
    if occurances_counter[digit]
      occurances_counter[digit] += 1
    else
      occurances_counter[digit] = 1
    end
  end
  # occurances_counter looks like this for input [1,1,2,2,2]: {1=>2, 2=>3}

  # create an array with the input number of elements + 1
  # at indexes equal to occurance number I will store an array of occured digits
  # +1 to have the last index available, e.g. [1,1,1] => [nil, nil, nil, (here at index 3 will be digit 1)]
  sorted_occurances = Array.new(list.size + 1)
  occurances_counter.each do |digit, counter|
    if !sorted_occurances[counter]
      sorted_occurances[counter] = Array.new
      sorted_occurances[counter] << digit
    else
      sorted_occurances[counter] << digit
    end
  end
  # sorted_occurances array for input c will be like: [nil, nil, [1,3], [2], nil, nil]
  # reverse to keep the needed order of inner arrays elements, then flatten and get rid of nil elements
  sorted_occurances = sorted_occurances.reverse.flatten.select { |element| !element.nil? }
  # the result is: [2,3,1] where 1 is least frequent, 2 is most frequent in the input array
  # the last step is to slice the k number of elements
  result = sorted_occurances.slice(0, k)
  return result
end






# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: O(n) where n is the number of all table elements
# Space Complexity: O(n) - created 3 new storages
def valid_sudoku(table)
  # edge cases
  return false if table.nil? || table.size != 9 || table[0].size != 9
  # 3 new storages will count number of occurances of each element for columns, rows and sub-boxes
  rows = Array.new(9)
  i = 0
  while i < rows.size
    rows[i] = {"1"=>0,"2"=>0,"3"=>0,"4"=>0,"5"=>0,"6"=>0,"7"=>0,"8"=>0,"9"=>0}
    i += 1
  end

  columns = Array.new(9)
  i = 0
  while i < columns.size
    columns[i] = {"1"=>0,"2"=>0,"3"=>0,"4"=>0,"5"=>0,"6"=>0,"7"=>0,"8"=>0,"9"=>0}
    i += 1
  end

  sub_boxes = Array.new(9)
  i = 0
  while i < sub_boxes.size
    sub_boxes[i] = {"1"=>0,"2"=>0,"3"=>0,"4"=>0,"5"=>0,"6"=>0,"7"=>0,"8"=>0,"9"=>0}
    i += 1
  end

  # loop through the input table to populate the above created storages with occurance numbers
  i = 0 # i is a row counter
  while i < table.size
    j = 0 # j is a column counter
    while j < table.size
      if table[i][j] != "."
        rows[i][table[i][j]] += 1
        columns[j][table[i][j]] += 1
        # find a number of a box/hash by calculating (i/3)*3 + (j/3)
        # e.g. for the element at indexes 1,2 the box will be: (1/3)*3 + (2/3) = 0, first box
        sub_boxes[(i/3)*3 + (j/3)][table[i][j]] += 1
      end
      j += 1
    end
    i += 1
  end
  # check if any of table elements occured more than 1 time within a row, a column or a sub-box
  rows.each do |hash|
    return false if hash.any? { |key, value| value > 1}
  end
  columns.each do |hash|
    return false if hash.any? { |key, value| value > 1}
  end
  sub_boxes.each_with_index do |hash, i|
    return false if hash.any? { |key, value| value > 1}
  end

  return true
end
