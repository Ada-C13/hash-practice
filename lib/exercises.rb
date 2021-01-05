
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n * klog(k))
# Space Complexity: O(n)

def grouped_anagrams(strings)
  hash_map = {}
  
  strings.each do |str| #n
    chars = str.chars   #k length of string
    sorted = chars.sort # k log(k)
    hash_map[sorted] ? hash_map[sorted].push(str) : hash_map[sorted] = [].push(str)
  end
 
  return hash_map.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  k_freq = []
  return k_freq if list.empty?
    
  hash_map = Hash.new

  list.each do |element| 
    hash_map[element] ? hash_map[element] += 1 : hash_map[element] = 1
  end
    
  vals = hash_map.values 
  max_vals = vals.max(k) 
  
  max_vals.each do |val| 
    key = hash_map.key(val)
    k_freq << key
    hash_map.delete(key)
  end
  return k_freq
end


# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same 
#   row, column or 3x3 subgrid
# Time Complexity: ?
# Space Complexity: ?
def valid_sudoku(table)
  table.each do |row|
    row_map = {}
    row.each do |elem|
      if elem != '.'
        if row_map[elem] 
          return false
        else
          row_map[elem] = 1
        end
      end
    end
 end
 
 i = 0
 9.times do
    column_map = {}
    table.each do |row|
        col = row[i]
        if col != '.'
              if column_map[col] 
                  return false
              else
                  column_map[col] = 1
              end
        end

    end
    k += 1
 end
 
 i = 0
 k = 0
 9.times do
    box_map = {}
    while i < i + 3
      while k < k + 3
          
      end
    end 
 end
 
 return true
end
