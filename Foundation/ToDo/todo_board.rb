require_relative "list.rb"
require_relative "item.rb"

class TodoBoard
    def initialize(hash)
        #@list = List.new(label)
        @hash = {}
    end
    def get_command
        print "Enter a command: "
        cmd, *args = gets.chomp.split(" ")
        case cmd
        when "mklist"
            @hash[*args] = List.new(*args)
            return true
        when "ls"
            @hash.each_key{ |key| puts key} 
            return true
        when "showall"
            @hash.each_value do |val| 
                val.print
                puts "\n"
            end
            return true
        when "mktodo"
            @hash[*args[0]].add_item(*args[1..-1])
            return true
        when "up"
            @hash[*args[0]].up(*args[1..-1].map!{|int| int.to_i})
            return true
        when "down"
            @hash[*args[0]].down(*args[1..-1].map!{|int| int.to_i})
            return true
        when "swap"
            @hash[*args[0]].swap(*args[1..-1].map!{|int| int.to_i})
            return true
        when "sort"
            @hash[*args[0]].sort_by_date
            return true
        when "priority"
            @hash[*args[0]].print_priority
            return true
        when "print"
            if !args[1..-1].empty?
                @hash[*args[0]].print_full_item(*args[1..-1].map!{|int| int.to_i})
            else
                @hash[*args[0]].print
            end
            return true
        when "toggle"
            @hash[*args[0]].toggle_item(*args[1..-1].map!{ |int| int.to_i})
            return true
        when "rm"
            @hash[*args[0]].remove_item(*args[1..-1].map!{ |int| int.to_i})
            return true
        when "purge"
            @hash[*args[0]].purge
            return true
        when "quit"
            return false
        else
            print "Sorry, that command is not recognized.\n"
            true
        end
    end
    def run
        while get_command
            get_command
        end
    end
end

p my_board = TodoBoard.new('cool-tech-to-learn')
p my_board.run