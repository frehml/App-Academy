require 'byebug'
require_relative 'tile.rb'

class Board
    attr_reader :board, :render, :reveal_adjacent
    def initialize(size)
        @size = size
        @board = Array.new(size){ Array.new(size){Tile.new(false)}}
    end
    def place_bomb
        amount = (@size*@size)/((4...10).to_a.sample)
        amount.times do
            x = (0...@size).to_a.sample
            y = (0...@size).to_a.sample
            @board[x][y] = Tile.new(true)
        end
        neighbors_of_bomb
    end
    def amount_bombs
        n = 0
        @board.each do |row|
            row.each do |tile|
                n += 1 if tile.bomb
            end
        end
        return n
    end
    def render
        n = 0
        print "  "
        (0...@size).each { |coord| print " #{coord}" }
        print "\n  "
        (@size*2).times{ print"-"}
        @board.each do |row|
            print "\n"
            print n
            print "| "
            n += 1
            row.each do |tile|
                if tile.flagged
                    print "F " 
                elsif tile.neighbour_bombs > 0 && tile.revealed
                    print "#{tile.neighbour_bombs} "
                elsif tile.neighbour_bombs == 0 && tile.revealed
                    print "_ "
                elsif !tile.revealed
                    print "* "
                end
            end
        end
        print "\n"
    end
    def bomb_coord
        array = []
        @board.each.with_index do |row, x|
            row.each.with_index do |tile, y|
                array << [x, y] if tile.bomb
            end
        end
        return array
    end
    def neighbors_of_bomb
        bomb_coord.each do |coord|
            x = coord[0]
            y = coord[1]
            (x-1..x+1).each do |row|
                (y-1..y+1).each do |col|
                    if row < 0 || col < 0 || row > @size-1 || col > @size-1 || @board[row][col].bomb
                        next
                    else
                        @board[row][col].add_neighbour
                    end
                end
            end
        end
    end
    def neighbor_array(coord)
        array = []
        x = coord[0]
        y = coord[1]
        (x-1..x+1).each do |row|
            (y-1..y+1).each do |col|
                if row < 0 || col < 0 || row > @size-1 || col > @size-1 || @board[row][col].bomb
                        next
                else
                    array << [row, col] if [row, col] != coord
                end
            end
        end
        return array
    end
    def reveal_array(coord)
        array = neighbor_array(coord)
        @size.times do
            array.each do |coordinate|
                x = coordinate[0]
                y = coordinate[1]
                array += neighbor_array(coordinate) if @board[x][y].neighbour_bombs == 0
            end
            array = array.uniq
        end
        return array
    end
    def reveal_adjacent(coord)
        array = reveal_array(coord)
        array.each do |coordinate|
            x = coordinate[0]
            y = coordinate[1]
            @board[x][y].reveal
        end
    end
end