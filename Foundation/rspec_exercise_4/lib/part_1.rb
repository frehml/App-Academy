def my_reject(array, &proc)
    new_arr = []
    array.each do |ele|
        new_arr << ele if !proc.call(ele)
    end
    return new_arr
end

def my_one?(array, &proc)
count = 0
    array.each do |ele|
        count += 1 if proc.call(ele)
    end
    if count == 1
        return true
    else
        return false
    end
end

def hash_select(hash, &proc)
    new_hash = {}
    hash.each do |k,v|
        new_hash.merge!(k => v) if proc.call(k,v)
    end
    return new_hash
end

def xor_select(array, proc1, proc2)
    new_array = []
    array.each do |ele|
        new_array << ele if (proc1.call(ele) && !proc2.call(ele)) || (!proc1.call(ele) && proc2.call(ele))
    end
    return new_array
end

def proc_count(val, procs)
    count = 0
    procs.each do |proc|
        count += 1 if proc.call(val)
    end
    return count
end