require_relative "board.rb"

class HumanPlayer
    attr_accessor :mark
    def initialize(mark_value)
        @mark = mark_value
    end
    def get_position(legal_positions)
        argument = false
        while argument == false
            puts "Please enter your coordinate like this (x y): "
            position = gets
            formatted = position.split(" ")
            formatted = [formatted[0].to_i, formatted[1].to_i]
            if legal_positions.include?(formatted)
                argument = true
            else
                puts "Illegal coordinate, try again."
            end
        end
        return formatted
    end
end