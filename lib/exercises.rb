
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n)
def grouped_anagrams(strings)
  # create an anagrams hash of arrays
  anagrams = {}
  # for each string, split the characters and sort them
  # join the characers, and test the hash keys
  # if the key already exists add it to the array of that key
  # if not create one
  strings.each do |word| 
    sorted_word = word.split(//).sort.join
    if anagrams[sorted_word]
      anagrams[sorted_word] << word
    else
      anagrams[sorted_word] = [word]
    end
  end
  
  # return the arrays
  anagrams.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  # create a counter hash for the numbers
  counter = {}
  # go through the list of numbers
  # test the hash keys, if it is not there, add it with a number 1 value
  # otherwise increment the value by 1
  list.each do |num|
    if !counter[num]
      counter[num] = 1
    else
      counter[num] += 1
    end
  end
  puts "this is counter"
  p counter

  puts "the K is " + k.to_s
 
  # find the K max counts
  highest_counts = counter.values.max(k)
  puts "this is highest_counts"
  p highest_counts
  # return the values of those keys
  most_frequent = []
  highest_counts.each do |n|
    most_frequent << counter.key(n)
    counter.delete(counter.key(n))
  end
  return most_frequent
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
