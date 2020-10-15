
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n * m) => where n is the number of strings & m is the length of each word
# Space Complexity: O(n) => because of hash

def grouped_anagrams(strings)
  words = {} 
  
  until strings.empty? 
    i = 0 
    word_to_compare = strings[0] # "eat" => "tan" => "bat"
    words[word_to_compare] = []
    # ["eat", "tea", "ate"]
    # ["tan", "nat"]
    # ["bat"]

    while i < strings.length 
      if permutation(word_to_compare, strings[i])
        words[word_to_compare].push(strings[i])
        strings.delete_at(i) 
        i -= 1
      end
      i += 1 # 0 => 0
    end
  end

  return words.values
end

def permutation(str1, str2)
  return true if str1.empty? && str2.empty?
  return false if str1.nil? || str2.nil?
  return false if str1.empty? || str2.empty?

  hash = {}

  str1.each_char do |char|
    hash[char] ? hash[char] += 1 : hash[char] = 1
  end

  str2.each_char do |char|
    hash[char] ? hash[char] -= 1 : false
  end

  return hash.values.all? { |value| value == 0 }
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n) => where n is the size of list
# Space Complexity: O(n) => because I created a hash and an array
def top_k_frequent_elements(list, k)
  return [] if k == 0

  frequency = {}
  list.each do |element|
    frequency[element] ? frequency[element] += 1 : frequency[element] = 1
  end

  return frequency.keys[0...k]
end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: O(1) => because we will always iterate 9 X 9
# Space Complexity: O(n) => because I create 3 hashes. 3n becomes n after dropping the constant

def valid_sudoku(table)
  row_list = {}
  col_list = {}

  i = 0
  while i < table.length 
    j = 0

    while j < table[i].length
  
      row_num = table[i][j]
      col_num = table[j][i]

      row_list = update_sub_grid(row_list, row_num)
      return false if !row_list

      col_list = update_sub_grid(col_list, col_num)
      return false if !col_list

      j += 1
    end


    row_list = {}
    col_list = {}
    
    i += 1
  end


  starting_points = [
    [0, 0],
    [0, 3],
    [0, 6],
    [3, 0],
    [3, 3],
    [3, 6],
    [6, 0],
    [6, 3],
    [6, 6]
  ]

  starting_points.each do |row_start, col_start|
    return false if !valid_sub_grid(table, row_start, col_start)
  end 

  return true
end


def update_sub_grid(sub_grid, num)
  if sub_grid[num] && num != "." 
    return false
  else 
    sub_grid[num] = true 
  end

  return sub_grid
end

def valid_sub_grid(table, row_start, col_start)
  sub_grid = {}

  3.times do |r|
    3.times do |c|
      current_num = table[row_start + r][col_start + c]

      if sub_grid[current_num] && current_num != "."
        return false 
      else 
        sub_grid[current_num] = true 
      end 
    end 
  end

  return true
end 