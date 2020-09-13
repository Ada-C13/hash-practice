
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

    puts "row: #{row_list}"
    puts "col: #{col_list}"


    row_list = {}
    col_list = {}
    
    i += 1
  end


  sub_grid = {}
  sub_grid = valid_sub_grid(table, sub_grid)
  return false if !sub_grid

  return true
end


def valid_sub_grid(table, sub_grid)
  i = 0
  while i < table.length
    n = 0
    while n < table[i].length

      num1 = table[i][n]
      num2 = table[i][n + 1]
      num3 = table[i][n + 2]

      num4 = table[i + 1][n]
      num5 = table[i + 1][n + 1]
      num6 = table[i + 1][n + 2]

      num7 = table[i + 2][n]
      num8 = table[i + 2][n + 1]
      num9 = table[i + 2][n + 2]

      sub_grid = update_sub_grid(sub_grid, num1)
      return false if !sub_grid

      sub_grid = update_sub_grid(sub_grid, num2)
      return false if !sub_grid

      sub_grid = update_sub_grid(sub_grid, num3)
      return false if !sub_grid

      sub_grid = update_sub_grid(sub_grid, num4)
      return false if !sub_grid

      sub_grid = update_sub_grid(sub_grid, num5)
      return false if !sub_grid

      sub_grid = update_sub_grid(sub_grid, num6)
      return false if !sub_grid

      sub_grid = update_sub_grid(sub_grid, num7)
      return false if !sub_grid

      sub_grid = update_sub_grid(sub_grid, num8)
      return false if !sub_grid

      sub_grid = update_sub_grid(sub_grid, num9)
      return false if !sub_grid


      puts "sub_grid: #{sub_grid}"
      sub_grid = {}

      n += 3

    end 

    i += 3
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



# 012 / 345 / 678


# e.g.
# table = [
#         ["5","3",".",".","7",".",".",".","."],
#         ["6",".","3","1","9","5",".",".","."],
#         [".","9","8",".",".",".",".","6","."],
#         ["8",".",".",".","6",".",".",".","3"],
#         ["4",".",".","8",".","3",".",".","1"],
#         ["7",".",".",".","2",".",".",".","6"],
#         [".","6",".",".",".",".","2","8","."],
#         [".",".",".","4","1","9",".",".","5"],
#         [".",".",".",".","8",".",".","7","9"]
#       ]

# 1st
# 00 / 01 / 02
# 10 / 11 / 12
# 20 / 21 / 22

# 30 / 31 / 32
# 40 / 41 / 42
# 50 / 51 / 52

# 60 / 61 / 62
# 70 / 71 / 72
# 80 / 81 / 82


# 03 / 04 / 05
# 13 / 14 / 15
# 23 / 24 / 25

# 33 / 34 / 35
# 43 / 44 / 45
# 53 / 54 / 55


# 06 / 07 / 08
# 16 / 17 / 18
# 26 / 27 / 28


# 36 / 37 / 38
# 46 / 47 / 48
# 56 / 57 / 58