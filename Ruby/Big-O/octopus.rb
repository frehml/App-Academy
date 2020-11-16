def sluggish_octopus(array)
    longest = ""
    array.each.with_index do |ele1, idx1|
        ele = ele1
        array.each.with_index do |ele2, idx2|
            if idx2 != idx1
                ele = ele2 if ele.length < ele2.length
            end
        end
        longest = ele if ele.length > longest.length
    end
    return longest
end

def dominant_octopus(array)
    
end