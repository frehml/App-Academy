def is_prime?(num)
    return false if num < 2
    (2...num).each do |number|
        return false if num % number == 0
    end
    return true 
end

def nth_prime(n)
array = []
(2..n*n+1).each do |num|
    array << num if is_prime?(num)
    break if array.length >= n
end
return array[n-1]
end

def prime_range(min, max)
array = []
(min..max).each do |num|
    array << num if is_prime?(num)
end
return array
end