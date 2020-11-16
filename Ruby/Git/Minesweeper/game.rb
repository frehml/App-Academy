require_relative 'tile.rb'
require_relative 'board.rb'
require 'yaml'

class Game
    print "Board size: "
    def initialize
        @size = gets.chomp.to_i
        @board = Board.new(@size)
    end
    def run
        @board.place_bomb
        until solved?
            @board.render
            print "flag/reveal coordinate: "
            input(gets.chomp)
        end
        print "\nYou won!\n"
    end
    def solved?
        n = 0
        @board.board.each do |row|
            row.each do |tile|
                n += 1 if tile.revealed || tile.bomb
            end
        end
        n == @size * @size
    end
    def input(input)
        if input[0] == 'r'
            coord = [input[1].to_i, input[3].to_i]
            @board.board[coord[0]][coord[1]].reveal
            @board.reveal_adjacent(coord) if @board.board[coord[0]][coord[1]].neighbour_bombs == 0
        elsif input[0] == 'f'
            @board.board[input[1].to_i][input[3].to_i].flag
        end
    end
end

game = Game.new
game.run