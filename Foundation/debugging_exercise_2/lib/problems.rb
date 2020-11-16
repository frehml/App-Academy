# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"

def largest_prime_factor(num)
i = num
while i >= 0
return i if num % i == 0 && is_prime?(i)
    i -= 1
end
end

def is_prime?(num)
return false if num < 2
(2...num).each do |factor|
 return false if num % factor == 0
end
true
end

def unique_chars?(string)
hash = Hash.new(0)
string.each_char { |char| hash[char] += 1}
hash.each_value { |v| return false if v > 1}
true
end

def dupe_indices(array)
hash = Hash.new([])
array.each_with_index { |char, i| hash[char] += [i] if is_duplicate?(array, char) }
return hash
end

def is_duplicate?(array, char)
count = 0
array.each { |c| count += 1 if c == char }
return true if count > 1
end

def ana_array(arr1, arr2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    arr1.each { |ele1| hash1[ele1] += 1}
    arr2.each { |ele2| hash2[ele2] += 1}
    hash1 == hash2
end