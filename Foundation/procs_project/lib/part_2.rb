def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
arr = str.split(" ")
arr.map!{ |word| prc.call(word)}
return arr.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    if prc1.call(num) > prc2.call(num)
        return prc1.call(num)
    else
        return prc2.call(num)
    end
end

def and_selector(arr, prc1, prc2)
    new_arr = arr.select { |num| prc1.call(num) && prc2.call(num)} 
    return new_arr
end

def alternating_mapper(arr, prc1, prc2)
    new_arr = arr.map.with_index do |num, i| 
        if i.even?
            prc1.call(num) 
        else 
            prc2.call(num)
        end
    end
    return new_arr
end