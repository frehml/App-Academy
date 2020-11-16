class Board
    
attr_reader :size, :grid

    def initialize(n)
        @grid = Array.new(n) { Array.new(n) {:N}}
        @size = n * n
    end
    
    def [](coords)
        @grid[coords[0]][coords[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        count = 0
        (0...@grid.length).each { |idx| count += @grid[idx].count(:S) }
        return count
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "You sunk my battleship"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        while self.num_ships < size/4
            self[[rand(0...Math.sqrt(size)).to_i, rand(0...Math.sqrt(size)).to_i]] = :S
        end
    end

    def hidden_ships_grid

        hidden_arr = Array.new(Math.sqrt(size)) { Array.new }

        @grid.each_with_index do |subarr, column|
            subarr.each do |ele|
                if ele == :S
                    hidden_arr[column] << :N
                else
                    hidden_arr[column] << ele
                end
            end
        end
        return hidden_arr
    end

    def self.print_grid(grid)
        grid.each do |column|
            print column.join(" ")
            print "\n"
        end
    end

    def cheat
        Board.print_grid(@grid)
    end
    
    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
