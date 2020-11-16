def some?(array, &proc)
  array.each do |ele|
    return true if proc.call(ele)
  end
  false
end

def exactly?(array, n, &proc)
  count = 0
  array.each do |ele|
    count += 1 if proc.call(ele)
  end
  count == n
end

def filter_out(array, &proc)
  new_array = []
  array.each do |ele|
    new_array << ele if !proc.call(ele)
  end
  new_array
end

def at_least?(array, n, &proc)
  count = 0
  array.each do |ele|
    count += 1 if proc.call(ele)
  end
  count >= n
end

def every?(array, &proc)
  count = 0
  array.each do |ele|
    count += 1 if proc.call(ele)
  end
  count == array.length
end

def at_most?(array, n, &proc)
  count = 0
  array.each do |ele|
    count += 1 if proc.call(ele)
  end
  count <= n
end

def first_index(array, &proc)
  array.each do |ele|
    return array.index(ele) if proc.call(ele)
  end
  nil
end

def xnor_select(array, proc1, proc2)
  new_array = []
  array.each do |ele|
    new_array << ele if (proc1.call(ele) && proc2.call(ele)) || (!proc1.call(ele) && !proc2.call(ele))
  end
  return new_array
end

def filter_out!(array, &proc)
  array.each.with_index do |ele, idx|
    array.slice!(idx) if proc.call(ele)
  end
  array
end

def multi_map(array, *number, &proc)
  number = 1 if number.empty?
  number[0].times do 
    array.map! { |ele| proc.call(ele)}
  end
  array
end

def proctition(array, &proc)
  new_array = []
  new_array << array.sort_by{ |ele| proc.call(ele) ? 0 : 1}
  new_array
end

def selected_map!(array, proc1, proc2)
  array.each.with_index do |ele, idx|
    array[idx] = proc2.call(ele) if proc1.call(ele)
  end
  array
end

def chain_map(val, array)
  result = val
  array.each do |proc|
    result = proc.call(result)
  end
  return result
end

def proc_suffix(sentence, hash)
  split_sentence = sentence.split
  split_sentence.each.with_index do |ele, idx|
    hash.each do |key, value|
      split_sentence[idx] += value if key.call(ele)
    end
  end
  return split_sentence.join(" ")
end

def proctition_platinum(array, *procs)
  hash = Hash.new {|hash, key| hash[key] = []}
  procs.each.with_index do |proc, idx|
    array.each do |ele|
      hash[idx+1] << ele if proc.call(ele)
    end
  end
  return hash
end

def procipher(sentence, hash)
  split_sentence = sentence.split(" ")
  split_sentence.each.with_index do |word, idx|
    hash.each do |k, v|
      split_sentence[idx] = v.call(split_sentence[idx]) if k.call(word)
    end
  end
  return split_sentence.join(" ")
end

def picky_procipher(sentence, hash)
  split_sentence = sentence.split(" ")
  split_sentence.each.with_index do |word, idx|
    hash.each do |k, v|
      if k.call(word)
        split_sentence[idx] = v.call(word)
        break
      end
    end
  end
  return split_sentence.join(" ")
end