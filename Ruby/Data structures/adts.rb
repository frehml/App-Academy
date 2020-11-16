class Stack
    def initialize
        @stack = []
    end

    def push(el)
        @stack << el
    end

    def pop
        @stack = @stack[0...-1]
    end

    def peek
        @stack[-1]
    end
  end

class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue << el
    end

    def dequeue
        @queue = @queue[1..-1]
    end

    def peek
        @queue[0]
    end
end

class Map
    def initialize
        @map = []
    end

    def set(key, value)
        includes = false
        @map.each do |pair| 
            if pair.include?(key)
                pair[1] = value 
                includes = true
                break
            end
        end
        @map << [key, value] if !includes
        return @map
    end

    def get(key)
        @map.select{ |ele| ele[0] == key }
    end

    def delete(key)
        return @map[1..-1] if @map[0].include?(key)
        return @map[0...-1] if @map[-1].include?(key)
        @map.each.with_index { |pair, idx| return @map[0...idx]+@map[idx+1..-1] if pair.include?(key)}
    end
end

