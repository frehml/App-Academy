def hipsterfy(word)
i = word.length - 1
vowels = "aeiou"
str = ""
while i > 0
    if vowels.include?(word[i])
        word = word[0...i] + word[i+1..-1]
    break
    end
    i -= 1
end
return word
end

def vowel_counts(str)
    hash = Hash.new(0)
    vowels = "aeiou"
    str.downcase!
    str.each_char do |char|
        if vowels.include?(char)
            hash[char] += 1
        end
    end
    return hash
end

def caesar_cipher(message, n)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    message.each_char.with_index do |char, i|
        if alphabet.include?(char)
        message[i] = alphabet[(alphabet.index(char) + n) % 26]
        end
    end
    return message
end