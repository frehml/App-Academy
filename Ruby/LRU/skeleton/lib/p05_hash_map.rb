require_relative 'p04_linked_list'

class HashMap
  attr_accessor :count
  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[key.hash % num_buckets].include?(key)
  end

  def set(key, val)
    resize! if @count > @store.length

    if !include?(key)
      @store[key.hash % num_buckets].append(key, val)
      @count += 1 
    else
      @store[key.hash % num_buckets].update(key, val)
    end
  end

  def get(key)
    @store[key.hash % num_buckets].get(key)
  end

  def delete(key)
    @store[key.hash % num_buckets].remove(key)
    @count -= 1 
  end

  def each
    for bucket in @store
      bucket.each do |node|
        yield node.key, node.val
      end
    end
  end

   def to_s
     pairs = inject([]) do |strs, (k, v)|
       strs << "#{k.to_s} => #{v.to_s}"
     end
     "{\n" + pairs.join(",\n") + "\n}"
   end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    dupe = @store
    @store = Array.new(num_buckets*2) { LinkedList.new }
    @count = 0

    for bucket in dupe
      bucket.each do |node|
        set(node.key, node.val)
      end
    end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
