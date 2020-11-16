def duos(string)
  count = 0
  string.each_char.with_index do |char1, idx1|
    string.each_char.with_index do |char2, idx2|
      if idx1 + 1 == idx2
        count += 1 if char1 == char2
      end
    end
  end
  return count
end

def sentence_swap(sentence, hash)
    split_sentence = sentence.split(" ")
    split_sentence.each.with_index do |word, index|
        hash.each do |key, value|
            split_sentence[index] = value if word == key
        end
    end
    return split_sentence.join(" ")
end

def hash_mapped(hash, proc, &block)
    new_hash = {}
    hash.each do |k, v|
        new_hash[block.call(k)] = proc.call(v)
    end
    return new_hash
end

def triplet_true(string)
    string.each_char.with_index do |char, idx|
        return true if char == string[idx + 1] && string[idx + 1] == string[idx + 2]
    end
    false
end

def energetic_encoding(sentence, hash)
  checker = false
  sentence.each_char.with_index do |ele, idx|
    hash.each do |k, v|
      if ele == k
        sentence[idx] = v 
        checker = true
      end
    end
    sentence[idx] = "?" if checker == false && sentence[idx] != " "
    checker = false
  end
  return sentence
end

def uncompress(string)
  new_string = ""
  string.each_char.with_index do |char, idx|
    if !idx.even?
      char.to_i.times do
        new_string += string[idx - 1]
      end
    end
  end
  return new_string
end

def conjunct_select(array, *procs)
  new_array = []
  checker = false
  array.each do |ele|
    procs.each do |proc|
      checker = proc.call(ele)
      break if !checker
    end
    new_array << ele if checker
  end
  return new_array
end

def convert_pig_latin(sentence)
  split_sentence = sentence.split(" ")
  new_sentence = []
  capitalized = false
  split_sentence.each do |word|
    if word.length < 3
      new_sentence << word
    elsif "aeiouAEIOU".include?(word[0])
      if word.capitalize == word
        new_sentence << word.capitalize + "yay" 
      else
        new_sentence << word.downcase + "yay" 
      end
    else
      capitalized = true if word.capitalize == word
      until "aeiouAEIOU".include?(word[0])
        word += word[0]
        word[0] = ""
      end
      if capitalized
        new_sentence << word.capitalize + "ay" 
      else
        new_sentence << word.downcase + "ay"
      end
    end
  end
  return new_sentence.join(" ")
end

def last_vowel(word)
  i = -1
  while i > -word.length
    return word[i..-1] if "aeiou".include?(word[i])
    i -= 1
  end
end

def reverberate(sentence)
  split_sentence = sentence.split(" ")
  new_sentence = ""
  split_sentence.each do |word|
    if word.length < 3
      new_sentence += word + " "
    elsif "aeiou".include?(word[-1])
      new_sentence += word + word + " "
    else
      new_sentence += word + last_vowel(word) + " "
    end
  end
  return new_sentence
end

def disjunct_select(array, *procs)
  new_array = []
  array.each do |ele|
    procs.each do |proc|
      if proc.call(ele)
        new_array << ele 
        break
      end
    end
  end
  return new_array
end

def alternating_vowel(sentence)

end

def silly_talk(sentence)
  split_sentence = sentence.split(" ")
  vowels = "aeiou"
  new_sentence = ""
  split_sentence.each do |word|
    if vowels.include?(word[-1])
      new_sentence += word + word[-1]
    else
      word.each_char do |char|
        if !vowels.include?(char)
          new_sentence += char 
        else
          new_sentence += char + "b" + char
        end
      end
    end
    new_sentence += " "
  end
  return new_sentence
end

def compress(string)
  compressed = ""
  string.each_char.with_index do |char1, idx1|
    string.each_char.with_index do |char2, idx2|
      if idx1 < idx2 && char1 != char2
        compressed += char1 
        compressed += (idx2 - idx1).to_s if (idx2 - idx1) > 1
      elsif idx2 == string.length - 1
        compressed += char1 
        compressed += (idx2 - idx1).to_s if (idx2 - idx1) > 1
      end
      break if compressed[-2] == char1 || compressed[-1] == char1
    end
  end
  return compressed
end
