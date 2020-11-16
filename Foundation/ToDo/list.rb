require_relative "item.rb"

class List
    def initialize(label)
        @label = label
        @items = []
    end
    def label
        @label
    end
    def label=(new_label)
        @label = new_label
    end
    def add_item(title, deadline, *description)
        description[0] = "" if description[0].nil?
        return false if !Item.valid_date?(deadline)
        @items << Item.new(title, deadline, description[0])
        true
    end
    def size
        @items.length
    end
    def valid_index?(index)
        !@items[index].nil?
    end
    def swap(index_1, index_2)
        return false if !valid_index?(index_1.to_i) || !valid_index?(index_2.to_i)
        @items[index_1.to_i], @items[index_2.to_i] = @items[index_2.to_i], @items[index_1.to_i]
        true
    end
    def [](index)
        return @items[index]
    end
    def priority
        return @items[0]
    end
    def print
        puts "-".ljust(54, '-')
        puts " ".ljust(27-@label.length/2, ' ') + "#{@label}"
        puts "-".ljust(54, '-')
        puts "Index".ljust(6, ' ') + "| Item".ljust(23, ' ') + "| Deadline".ljust(13, ' ') + "| Completion"
        puts "-".ljust(54, '-')
        @items.each.with_index do |item, index|
            puts "#{index}".ljust(6, ' ') + "| #{item.title}".ljust(23, ' ') + "| #{item.deadline}".ljust(13, ' ') + "| #{item.done ? "[✓]" : "[X]"}"
        end
        puts "-".ljust(54, '-')
    end
    def print_full_item(index)
        puts "-".ljust(54, '-')
        puts "#{@items[index].title}".ljust(44, ' ') + "#{@items[index].deadline}"
        puts "#{@items[index].description}".ljust(41, ' ') + "Complete: #{@items[index].done ? "[✓]" : "[X]"}"
        puts "-".ljust(54, '-')
    end
    def print_priority
        print_full_item(0)
    end
    def up(index, *amount)
        return false if !valid_index?(index)
        amount[0] = 1 if amount[0].nil?
        until amount[0] == 0 || index == 0
            swap(index, index-1)
            index -= 1
            amount[0] -= 1
        end
        true
    end
    def down(index, *amount)
        return false if !valid_index?(index)
        amount[0] = 1 if amount[0].nil?
        until amount[0] == 0 || index == @items.length - 1
            swap(index+1, index)
            index += 1
            amount[0] -= 1
        end
        true
    end
    def sort_by_date
        @items.sort_by! do |item|
            item.deadline
        end
    end
    def toggle_item(index)
        @items[index].toggle
    end
    def remove_item(index)
        return false if !valid_index?(index)
        @items.delete_at(index)
        return true
    end
    def purge
        @items.each.with_index do |item, index|
            @items.delete_at(index) if item.done
        end
    end
end

#p my_list = List.new('Groceries')
#p my_list.size
#p my_list.add_item('cheese', '2019-10-25', 'Get American and Feta for good measure.')
#p my_list.add_item('toothpaste', '2019-11-25')
#p my_list.add_item('shampoo', '2019-10-24')
#p my_list.add_item('candy', '2020-10-31', '4 bags should be enough')
#p my_list.print
#p my_list.sort_by_date
#p my_list.print