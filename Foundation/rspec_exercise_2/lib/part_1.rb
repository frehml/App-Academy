def partition(arr, num)
new_arr = [[],[]]
arr.each do |number|
if number < num
    new_arr[0] << number
else
    new_arr[1] << number
end
end
return new_arr
end

def merge(hash_1, hash_2)
new_hash = {}
hash_1.each {|k1, v1| new_hash[k1] = v1}
hash_2.each {|k2, v2| new_hash[k2] = v2}
hash_1.each_key do |key| 
if hash_2.has_key?(key)
    new_hash[key] = hash_2[key]
end
end
return new_hash
end

def censor(sentence, curse_words)
arr = sentence.split
new_arr = []
arr.each do |word|
    if curse_words.include?(word.downcase)
        new_arr << censor_word(word)
    else
        new_arr << word
end
end
return new_arr.join(" ")
end

def censor_word(curse_word)
    vowels = "aeiou"
    curse_word.each_char.with_index do |char, i|
        if vowels.include?(char.downcase)
            curse_word[i] = "*"
        end
    end
    return curse_word
end

def power_of_two?(num)
solution = 0
while solution < num
(0..num).each do |number|
    if num == 2 ** number
        return true
    end
  solution = 2 ** number
end
end
return false
end

