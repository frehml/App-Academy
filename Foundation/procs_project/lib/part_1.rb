def my_map(arr, &prc)
    array = []
    arr.each { |num| array << prc.call(num)}
    return array
end

def my_select(arr, &prc)
    array = []
    arr.each { |num| array << num if prc.call(num)}
    return array 
end

def my_count(arr, &prc)
    count = 0
    arr.each { |num| count += 1 if prc.call(num)}
    return count
end

def my_any?(arr, &prc)
    arr.each { |num| return true if prc.call(num)}
    return false
end

def my_all?(arr, &prc)
    arr.each { |num| return false if !prc.call(num)}
    return true
end

def my_none?(arr, &prc)
    arr.each { |num| return false if prc.call(num)}
    return true
end