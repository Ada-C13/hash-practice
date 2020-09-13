
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n^2) where n is the number of strings? || O(n) where n is the total number of characters? 
# Space Complexity: O(n) where a new hash is storing the n # of strings

def grouped_anagrams(strings)
  return [] if strings.empty?
  groups = Hash.new()

  # sort each string so we can compare if they look the same == anagrams
  strings.each do |string|
    sorted_str = string.split("").sort.join

    # store data into groups
    if groups[sorted_str]
      groups[sorted_str] << string
    else
      groups[sorted_str] = []
      groups[sorted_str] << string
    end
  end
  # print groups

  return groups.values
end


# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: ?
# Space Complexity: ?
def top_k_frequent_elements(list, k)
  # loop through list and create hash: num => count
  # then search for the k-most frequent values mapped to key
  return [] if list.empty?

  count = {}
  list.each do |num|
    count[num] ? count[num] += 1 : count[num] = 1
  end
  # print count
  
  ans = count.keys.max_by(k){|key| count[key] }
  # https://apidock.com/ruby/Enumerable/max_by
  # print count.keys
  # print ans
  return ans
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


# Thought I could use a hash function to solve grouped_anagrams, but realized the sum/math would cause incorrect results
# def grouped_anagrams(strings)
#   # hash function and add sum
#   # 2 factors: score by alphabet and string length  # can I assume they are anagrams if both factors meet?
#   return [] if strings.empty?
#   alpha = {
#     "a" => 1, "b" => 2, "c" => 3, "d" => 4, "e" => 5, 
#     "f" => 6, "g" => 7, "h" => 8, "i" => 9, "j" => 10,
#     "k" => 11, "l" => 12, "m" => 13, "n" => 14, "o" => 15, 
#     "p" => 16, "q" => 17, "r" => 18, "s" => 19, "t" => 20,
#     "u" => 21, "v" => 22, "w" => 23, "x" => 24, "y" => 25, "z" => 26,
#   }
#   groups = Hash.new()

#   strings.each do |string|
#     # loop through each letter and count total score # get length
#     l = 0
#     sum = 0
#     while l < string.length
#       char = string[l]
#       sum += alpha[char]
#       l += 1
#     end
    
#     # store data into groups
#     if groups[sum]
#       groups[sum] << string
#     else
#       groups[sum] = []
#       groups[sum] << string
#     end
#   end
#   # print groups

#   return groups.values
# end