def palindrome?(string)
reverse_index = -1
normal_index = 0
while normal_index < string.length
if string[reverse_index] != string[normal_index]
    return false
end
    normal_index += 1
    reverse_index -= 1

end
true
end

def substrings(string)
array = []
str = ""
n = 0
while n < string.length 
(n...string.length).each do |num|
    str += string[num]
    if array.include?(str) == false
    array << str
    end
end
str = ""
n += 1
end
return array
end

def palindrome_substrings(string)
    array = substrings(string).select { |substring| palindrome?(substring) && substring.length > 1}
    return array
end