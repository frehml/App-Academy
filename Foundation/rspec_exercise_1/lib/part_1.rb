def average(a, b)
return (a + b) / 2.0
end

def average_array(arr)
(arr.inject{|accum, ele| accum + ele}) / (arr.length * 1.0)
end

def repeat(word, num)
str = ""
num.times do
str += word
end
return str
end

def yell(str)
str.upcase! + "!"
end

def alternating_case(str)
arr = str.split(" ")
arr.each_with_index do |word, i|
if i % 2 == 0
    word.upcase!
else
    word.downcase!
end
end
return arr.join(" ")
end