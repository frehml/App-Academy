def element_count(arr)
    hash = Hash.new(0)
    arr.each do |ele|
        hash[ele] += 1
    end
    return hash
end

def char_replace!(string, hash)
    string.each_char.with_index do |char, i|
      string[i] = hash[char] if hash.has_key?(char)
    end
    return string
end

def product_inject(array)
   return array.inject{ |a, b| a*b} 
end