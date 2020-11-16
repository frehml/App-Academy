class Tile
    attr_reader :flagged, :revealed, :bomb, :reveal, :flag, :neighbour_bombs
    def initialize(bomb)
        @flagged = false
        @revealed = false
        @bomb = bomb
        @neighbour_bombs = 0
    end
    def reveal
        raise "Boom!" if @bomb
        @revealed = true
    end
    def flag
        @flagged = true
    end
    def add_neighbour
        @neighbour_bombs += 1
    end
end

