require_relative "board.rb"

class HumanPlayer
    attr_accessor :mark
    def initialize(mark_value)
        @mark = mark_value
    end
    def get_position
        puts "Please enter your coordinate like this (x y): "
        position = gets
        formatted = position.split(" ")
        raise error if !"1234567890".include?(formatted[0]) || !"1234567890".include?(formatted[1]) || formatted.length > 2
        formatted = [formatted[0].to_i, formatted[1].to_i]
    end
end