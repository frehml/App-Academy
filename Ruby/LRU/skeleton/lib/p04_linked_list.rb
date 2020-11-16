class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new

    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each { |node| return node.val if node.key == key}
  end

  def include?(key)
    self.each { |node| return true if node.key == key}
    false
  end

  def append(key, val)
    node = Node.new(key, val)

    if empty?
      @head.next = node
      node.prev = @head
      @tail.prev = node
    else
      node.prev = @tail.prev
    end

    node.next = @tail
    @tail.prev = node
    (node.prev).next = node
  end

  def update(key, val)
    self.each { |node| node.val = val if node.key == key}
  end

  def remove(key)
    node = @head
    self.each { |n| node = n if n.key == key}

    node.prev.next = node.next
    node.next.prev = node.prev
  end

  def each
    node = @head.next

    until node == @tail
      yield node
      node = node.next
    end

  end

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end