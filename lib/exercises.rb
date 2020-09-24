# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: o(n2) because I am iterating over the string and
# I know Bytes is gonna iterate over it as well
# Space Complexity: 0(n)

def grouped_anagrams(strings)
  hash_ana = {}
  outerArray = []

  # The way I identify they are anagrams is using bytes to get the ASCII value of each char sum them,
  # Then we know all the characters have the same letter on it.
  strings.each do |string|
    if hash_ana[string.bytes.sum]
      hash_ana[string.bytes.sum].push(string)
    else
      hash_ana[string.bytes.sum] = [string]
    end
  end

  hash_ana.each do |key|
    outerArray << key[1]
  end

  return outerArray
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: o(n)
# Space Complexity: o(1)
def top_k_frequent_elements(list, k)
  return [] if list.empty?

  count_hash = Hash.new(0)
  result = []

  list.each do |element|
    count_hash[element] += 1
  end

  max_array = count_hash.sort_by { |k, v| -v }

  (0...k).each do |i|
    result << max_array[i][0]
  end

  return result
end

# This method will return the true if the table is still
#   a valid sudoku table.
#   Each element can either be a ".", or a digit 1-9
#   The same digit cannot appear twice or more in the same
#   row, column or 3x3 subgrid
# Time Complexity: o(n3) 
# Because of the extra Checking I am doing inside of each row array with the includes?
# Space Complexity: 0(1)
def valid_sudoku(table)
  store = {
    rows: {},
    cols: {},
    square: {},
  }
  # First loop it represents the first row we are checking
  # Second loop it represents the column.

  (0...9).each do |i|
    (0...9).each do |j|
      box = table[i][j]
      if !store[:rows][i] && box != "."
        store[:rows][i] = []
        store[:rows][i].push(box)
      elsif box != "." && !store[:rows][i].include?(box)
        store[:rows][i].push(box)
      elsif store[:rows][i] && store[:rows][i].include?(box)
        return false
      end

      if !store[:cols][j] && box != "."
        store[:cols][j] = []
        store[:cols][j].push(box)
      elsif box != "." && !store[:cols][j].include?(box)
        store[:cols][j].push(box)
      elsif store[:cols][j] && store[:cols][j].include?(box)
        return false
      end

      # Converting to float and the ceil to round up always.
      squareRowId = ((i + 1).to_f / 3).ceil
      squareColId = ((j + 1).to_f / 3).ceil
      # The squeare id is gonna be like
      # 1-1 , 1-2, 1-3
      # 2-1 , 2-2, 2-3
      # 3-1 , 3-2, 3-3

      squareId = "#{squareRowId}-#{squareColId}"

      # Here insted of checking rows and colums I will be checking the numbers inside of this
      # Squeare ids.
      if !store[:square][squareId] && box != "."
        store[:square][squareId] = []
        store[:square][squareId].push(box)
      elsif box != "." && !store[:square][squareId].include?(box)
        store[:square][squareId].push(box)
      elsif store[:square][squareId] && store[:square][squareId].include?(box)
        return false
      end
    end
  end
  return true
end
