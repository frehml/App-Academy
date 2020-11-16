def proper_factors(num)
    array = []
    (1...num).each do |number|
        array << number if num % number == 0
    end
    return array
end

def aliquot_sum(num)
    return proper_factors(num).sum
end

def perfect_number?(number)
    if number == aliquot_sum(number)
        return true
    else
        return false
    end
end

def ideal_numbers(n)
    array = []
    number = 2
    while array.length < n
        array << number if perfect_number?(number)
        number += 1
    end
    return array
end