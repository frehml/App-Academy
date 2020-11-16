require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
    @count = 0
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      val = @store.get(key)
      @store.remove(key)
      @store.append(key, val)
    else
      val = @prc.call(key)
      @store.append(key, val)
      @count += 1
    end

    eject! if @count > @max
    update_node!(@store.last)
    return val
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    @map.set(node.key, node)
  end

  def eject!
    node = @store.first
    @map.delete(node.key)
    @store.remove(node.key)
    @count -= 1
  end
end
