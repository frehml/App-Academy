def prime?(n)
    if n < 2 
        return false
    end

(2...n).each do |num|
    if n % num == 0
        return false
end
end
return true
end