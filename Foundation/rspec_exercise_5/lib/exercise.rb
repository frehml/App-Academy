def zip(*array)
    new_array = Array.new(array[0].length) { |index| []}
    (0...new_array.length).each do |idx1|
      (0...array.length).each do |idx2|
        new_array[idx1] << array[idx2][idx1]
    end
    end
    return new_array
end

def prizz_proc(arr, proc1, proc2)
    new_array = []
    arr.each do |ele|
        new_array << ele if (proc1.call(ele) && !proc2.call(ele)) || (!proc1.call(ele) && proc2.call(ele))
    end
    new_array
end

def zany_zip(*array)
    length = array.sort_by { |array| -array.length }[0].length
    new_array = Array.new(length) { |index| []}
    (0...new_array.length).each do |idx1|
      (0...array.length).each do |idx2|
        new_array[idx1] << array[idx2][idx1]
    end
    end
    return new_array
end

def maximum(array, &proc)
    return nil if array.empty?
    element = []
    array.each do |ele|
        element = [ele] if element.empty? || proc.call(ele) >= proc.call(element[0])
    end
    return element[0]
end

def my_group_by(array, &proc)
    hash = Hash.new { |hash, key| hash[key] = []}
    array.each do |ele|
        hash[proc.call(ele)] << ele
    end
    return hash
end

def max_tie_breaker(array, proc, &block)
    return nil if array.empty?
    element = []
    array.each do |ele|
        if element.empty? || block.call(ele) > block.call(element[0])
            element = [ele] 
        elsif element[0] == block.call(ele)
            element = [ele] if proc.call(ele) > proc.call(element[0])
        end
    end
    return element[0]
end

def ammount_of_vowels(word)
  count = 0
  word.each_char do |char|
    count += 1 if "aeiou".include?(char)
  end
  return count
end

def adapted_word(word)
  indeces = []
  word.each_char.with_index do |char, i|
    if "aeiou".include?(char)
      indeces << i
    end
  end
  return word[indeces[0]..indeces[-1]]
end

def silly_syllables(sentence)
  split_sentence = sentence.split(" ")
  new_sentence = []
  split_sentence.each do |word|
    if ammount_of_vowels(word) < 2
      new_sentence << word 
    else
      new_sentence << adapted_word(word)
    end
  end
  return new_sentence.join(" ")
end