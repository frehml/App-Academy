class MaxIntSet
  attr_reader :store

  def initialize(max)
    @max = max
    @store = Array.new(max){false}
  end

  def insert(num)
    is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    is_valid?(num)
    @store[num] = false
  end

  def include?(num)
    is_valid?(num)
    return @store[num]
  end

  private

  def is_valid?(num)
    raise "Out of bounds" if num > @max || num < 0
  end
end


class IntSet
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % num_buckets] << num
  end

  def remove(num)
    @store[num % num_buckets].delete(num)
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count >= num_buckets
      resize!
    end

    if !include?(num)
      @store[num % num_buckets] << num
      @count += 1
    end
  end

  def remove(num)
    if include?(num)
      @store[num % num_buckets].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
      array = @store
      @store = Array.new(num_buckets * 2) { Array.new }
      @count = 0

      array.each do |bucket|
        bucket.each do |ele|
          insert(ele)
        end
      end
  end
end
