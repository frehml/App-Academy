class Array
    def my_each(&proc)
        i = 0
        while i < self.length
            proc.call(self[i])
            i += 1
        end
        return self
    end
    def my_select(&proc)
        new_array = []
        self.my_each { |num| new_array << num if proc.call(num)}
        return new_array
    end
    def my_reject(&proc)
        new_array = []
        self.my_each { |num| new_array << num if !proc.call(num)}
        return new_array
    end
    def my_any?(&proc)
        self.my_each { |num| return true if proc.call(num)}
        false
    end
    def my_all?(&proc)
        self.my_each { |num| return false if !proc.call(num)}
        true
    end
    def my_flatten
        flattened = []

        self.my_each do |el|
        if el.is_a?(Array)
            flattened.concat(el.my_flatten)
        else
            flattened << el
        end
        end

        flattened
    end
    def my_zip(*arrays)
        new_array = Array.new(self.length) { |index| []}
        i = 0
            while i < self.length
                new_array[i] << self[i] 
                arrays.my_each { |array| new_array[i] << array[i]}
                i += 1
            end
        return new_array
    end
    def my_rotate(*n)
        n[0].nil? ? num = 1 : num = n[0]
        num = self.length - 1 % num if num >= self.length
        new_array = []
        while new_array.length < self.length
            num = -num if num >= self.length - num - 1
            new_array << self[num]
            num += 1
        end
        return new_array
    end
    def my_join(*seperator)
        seperator[0].nil? ? sep = "" : sep = seperator[0]
        string = ""
        self.my_each do |part|
            string += part + sep
        end
        return string[0...-1] if !seperator[0].nil?
        return string
    end
    def my_reverse
        i = -1
        new_array = []
        while new_array.length < self.length
            new_array << self[i]
            i -= 1
        end
        return new_array
    end
end

