

def no_dupes?(array)
    hash = Hash.new(0)
    new_arr = []

    array.each do |ele|
        hash[ele] += 1
    end
    

    hash.each do |value, key|
        new_arr << value if key == 1
    end
    return new_arr
end

def no_consecutive_repeats?(array)
    array.each_with_index do |ele, idx|
        if idx < array.length - 2
            return false if ele == array[idx + 1]
        end
    end
    return true
end

def char_indices(str)
    hash = Hash.new {|hash, key| hash[key] = []}
    str.each_char.with_index { |char, idx| hash[char] += [idx]}
    return hash
end


def longest_streak(str)
    

end


def prime?(num)
    (2...num).each do |factor|
        return false if num % factor == 0
    end
    return true
end

def bi_prime?(num)
    (2..num/2).each do |num1|
        (2..num/2).each do |num2|
            if !prime?(num1) && !prime?(num2)
                return false if num1*num2 == num
            end
        end
    end
    return true
end

def vigenere_cipher(message, keys)
msg_idx = 0
kys_idx = 0
new_str = ""
alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    while msg_idx < message.length
        keys.length.times do
            new_str += alphabet[alphabet.index(message[msg_idx]) + keys[kys_idx]]
            msg_idx += 1
            kys_idx += 1
        end
        kys_idx = 0
    end
    return new_str
end


def vowel_rotate(str)
    vowels = "aeiou"
    idx_arr = []
    new_word = ""
    str.each_char.with_index do |char, idx|
            idx_arr << idx if vowels.include?(char)
    end

    (0...idx_arr.length).each do |index|
        if index == 0
            new_word += str[0...idx_arr[index]] + str[idx_arr[index - 1]]
        else
            new_word += str[idx_arr[index - 1] + 1...idx_arr[index]] + str[idx_arr[index - 1]]
        end
    end
    return new_word + str[new_word.length .. -1]
end

class String
    def select(&proc)
        new_word = ""
        return "" if proc.nil?
            self.each_char do |char|
                new_word += char if proc.call(char)
            end
        return new_word
    end

    def map!(&proc)
        new_word = ""
        self.each_char do |char|
            new_word += proc.call(char)
        end
        self.replace(new_word)
        return self
    end
end

def multiply(a, b)  
  if (a >= 0 && b >= 0) || (a <= 0 && b >= 0)
    if b < 2 
        return a
    else
        a + multiply(a, b - 1)
    end
  else
    if a < 2 
        return b
    else
        b + multiply(a - 1, b)
    end
  end
end

def lucasSequence(length)
    array = []

    if length == 0
        return length
    else
       lucasSequence(length - 1) + lucasSequence(length - 2)
    end
end

def prime_factorization(num)

end