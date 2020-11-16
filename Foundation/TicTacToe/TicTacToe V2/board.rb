class Board
    def initialize(n)
        @grid = Array.new(n) { |idx1| Array.new(n) { |idx2| "_"}}
    end
    def valid?(position)
        !@grid[position[0]][position[1]].nil?
    end
    def empty?(position)
        @grid[position[0]][position[1]] == "_"
    end
    def place_mark(position, mark)
        raise "Out of bounds" if !valid?(position)
        raise "This space is occupied" if !empty?(position)
        @grid[position[0]][position[1]] = mark
    end
    def print
        puts @grid.map{ |ele| ele.join(" ")}
    end
    def win_row?(mark)
        @grid.each { |row| return true if row.uniq == [mark]}
        false
    end
    def win_col?(mark)
        col = []
         (0...@grid.length).each do |index|
            @grid.each do |row|
                col << row[index]
            end
            return true if col.uniq == [mark]
            col = []
        end
        false
    end
    def win_diagonal?(mark)
        num = 0
        diag = []
        first_go = true
        2.times do
          @grid.reverse! if !first_go
          first_go = false
          @grid.length.times do
              diag << @grid[num][num]
              num += 1
          end
          return true if diag.uniq == [mark]
          num = 0
          diag = []
        end
        @grid.reverse!
        false
    end
    def win?(mark)
        if win_diagonal?(mark) || win_col?(mark) || win_row?(mark)
            return true
        end
        false
    end
    def empty_positions?
        @grid.each do |row|
          row.each { |ele| return true if ele == "_"}
        end
        return false
    end
end