
# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: n*mlog(m) where m is the size of the words and n is the number of words. nm2 (nm squared) is the worst case. (I am confused here)
# Space Complexity: O(n) for the making of the hash and return value

def grouped_anagrams(strings)
  
  sortedWords = {}

  def abc(word)
    word = word.chars.sort.join
    puts word
    return word
  end

  strings.each do |word|
    abcWord = abc(word)

    if !sortedWords[abcWord]
      sortedWords[abcWord] = [word]
    else 
      sortedWords[abcWord].push(word)
    end
  end

  return sortedWords.values

end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity:  o(n2) there is a loop within a loop
# Space Complexity: O(n) do to the new hash and arrray.
def top_k_frequent_elements(list, k)
  frequency = {}

  list.each do |char|
    if !frequency[char]
      frequency[char] = 1
    else
      frequency[char] += 1
    end
  end

  answer = []
  values = frequency.values
  topValues = values.sort

  k.times do |i|
    wantedValue = topValues[-1 - i]

    frequency.each  do |key, value|
      if value == wantedValue
        answer.push(key)
        frequency.delete(key)
        break
      end
    end
  end

  return answer

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
