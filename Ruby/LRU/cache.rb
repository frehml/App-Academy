class LRUCache
  def initialize(size)
      @array = []
      @size = size
  end

  def count
    p(@array.length)
  end

  def add(el)
    @array << el if !@array.include?(el)
    @array.shift if @array.count > @size
  end

  def show
    p(@array)
  end

  private
  # helper methods go here!
end