require_relative 'card.rb'

class Board
    attr_reader :grid
    def initialize(size)
        @size = size
        @grid = []
    end
    def populate
        while @grid.length < @size * @size
            val = ('A'..'Z').to_a.sample
            if !@grid.include?(val)
                2.times do
                    @grid << Card.new(val)
                end
            end
        end
        @grid = @grid.shuffle.each_slice(@size).to_a
        return @grid
    end
    def render
        i = 0
        print "  "
        (0...@size).each { |num| print "#{num} "}
        @grid.each do |row|
            print "\n"
            print i
            print " "
            i += 1
            row.each do |ele|
                print ele.display
                print " "
            end
        end
    end
    def won?
        @grid.each do |row| 
            row.each {|ele| return false if !ele.face_up}
        return true
        end
    end
    def reveal(x, y)
        @grid[x][y].reveal
        return @grid[x][y]
    end
    def [](pos)
        return @grid[pos[0].to_i][pos[2].to_i]
    end
end

