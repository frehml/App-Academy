require "byebug"

def select_even_nums(array)
array.select(&:even?)
end

def reject_puppies(dogs)
dogs.reject { |k| k["age"] < 3 }
end

def count_positive_subarrays(array)
array.count { |arr| arr.sum > 0 }
end

def aba_translate(word)
vowels = "aeiou"
new_arr = []
word.each_char.with_index do |char, i|
    if vowels.include?(char)
        new_arr << char + "b" + char
    else 
        new_arr << char
    end
end
return new_arr.join("")
end

def aba_array(words)
    words.map { |word| aba_translate(word)}
end