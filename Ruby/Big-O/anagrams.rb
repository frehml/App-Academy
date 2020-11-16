def bad_two_sum?(array, target)
    new_array = []
    array.each_with_index do |ele1, idx1|
        array.each_with_index do |ele2, idx2|
            if idx1 < idx2
                new_array << ele1 + ele2
            end
        end
    end
    new_array.include?(target)
end

def okay_two_sum?(array, target)
    array = array.sort
    return true if array.length == 2 && array.inject{|cum, sum| cum + sum} == target
end

p okay_two_sum?([0, 1, 5, 7], 6)