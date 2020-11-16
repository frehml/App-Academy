# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span 
    array = self.sort
    if array.length > 0 
        return array[-1] - array[0]
    else 
        return nil
    end
  end
  def average
    sum = 0
    self.each { |ele| sum += ele }
    if self.length > 0 
        return sum / self.length.to_f
    else
        return nil
    end
  end
  def median
    array = self.sort
    if array.length > 0
        if array.length.even?
            return ((array[array.length/2] + array[array.length/2 - 1]) / 2.0)
        else
            return array[array.length/2.0]
        end
    else
        return nil
    end
  end
  def counts
    hash = Hash.new(0)
    self.each do |ele|
        hash[ele] += 1
    end
        return hash
  end
  def my_count(value)
    count = 0
    self.each do |val|
        count += 1 if val == value
    end
    return count
  end
  def my_index(value)
    self.each.with_index { |val, i| return i if val == value}
    return nil
  end
  def my_uniq
    hash = Hash.new(0)
    array = []
    self.each { |ele| hash[ele] += 1}
    hash.each_key { |k| array << k}
    return array
  end
  def my_transpose
    i = 0
    new_array = Array.new(self.length) {Array.new}
    self.each do |subarr|
        while i < self[0].length
            new_array[i] << subarr[i]
            i += 1
        end
        i = 0
    end
    return new_array
  end
end