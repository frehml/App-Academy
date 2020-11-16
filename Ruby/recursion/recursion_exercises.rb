def range(n1, n2)
    return [] if n2 < n1
    return [n1] if n2 == n1
    range = []
    range(n1, n2 - 1) << n2
end

def sum_array_it(array)
    array.inject { |cum, ele| cum + ele}
end

def sum_array_rec(array)
    return 0 if array.length < 1
    array[0] += sum_array_rec(array[1..-1])
end

def exponentiation1(num, power)
    return 1 if power == 0
    num * exponentiation1(num, power-1)
end

def exponentiation2(b, n)
    return 1 if n == 0
    return b if n == 1
    n.even? ? exponentiation2(b, n / 2) ** 2 : b * (exponentiation2(b, (n - 1) / 2) ** 2)
end

class Array
    def deep_dup

    end
end

def fibonacci_it(n)
    fibo = [1, 1]
    while fibo.length < n
        fibo << fibo[-2] + fibo[-1]
    end
    return fibo
end

def fibonacci_rec(n)

end

def binary_search(array, target)
    return [] if array.length < 1
    binary_search(array[(array.length-1)/2..-1], target) if target > array[0]
    binary_search(array[0..(array.length-1)/2], target) if target < array[0]
end

p binary_search([1, 2, 3], 5)