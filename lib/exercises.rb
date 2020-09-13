# This method will return an array of arrays.
# Each subarray will have strings which are anagrams of each other
# Time Complexity: O(n)
# Space Complexity: O(n)

def grouped_anagrams(strings) 
  h = {}
  return [] if strings.nil? || strings.empty? || !strings.is_a?(Array)
  strings.each do |str|   
    key = str.chars.sort.join
    if h[key].nil?
      h[key] = [str]
    else
      h[key] << str
    end 
  end
  p h.values
  return h.values
end

# This method will return the k most common elements
# in the case of a tie it will select the first occuring element.
# Time Complexity: O(n)
# Space Complexity: O(n)
def top_k_frequent_elements(list, k)
  h = {}
  solution = []
  return solution if list.nil? || list.empty? || !list.is_a?(Array)
  list.each do |element|
    if h[element].nil?
      h[element] = 1
    else
      h[element] += 1
    end
  end
  p h
  k.times do
    top = nil
    h.each do |element,value|  
      if value && (top.nil? || value > top)
        top = element
      end
    end 
    if top 
      h[top] = nil
      solution << top
    end
  end 
  return solution
end 
