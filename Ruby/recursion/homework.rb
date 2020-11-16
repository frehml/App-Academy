def sum_to(n)
    return nil if n < 0
    return 1 if n == 1
    n + sum_to(n-1)
end

def add_numbers(array)
    return array[0] if array.length <= 1
    array[0] + add_numbers(array[1..-1])
end

def reverse(string)
    return string[0] if string[0...-1].length < 1
    string[-1] += reverse(string[0...-1])
end

def gamma_fnc(num)
    return 1 if num == 1
    (num - 1) * gamma_fnc(num-1)
end

def ice_cream_shop(flavors, favorite)
    return true if flavors[0] == favorite
    return false if flavors.length < 1
    ice_cream_shop(flavors[1..-1], favorite)
end

 p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
 p  ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
 p  ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
 p  ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
p  ice_cream_shop([], 'honey lavender')  # => returns false