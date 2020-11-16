require_relative "board"
require_relative "player"

class Battleship

attr_reader :board, :player, :remaining_misses


    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = (n*n)/2
    end

    def start_game
        @board.place_random_ships
        print "there are #{@board.num_ships} ships"
        print "\n"
        p @board.print
    end

    def lose?
        if @remaining_misses <= 0
            print "you lose"
            true
        else
            false
        end
    end

    def win?
        if @board.num_ships == 0
            print "you win"
            true
        else
            false
        end
    end

    def game_over?
        if self.win? || self.lose?
            return true
        else
            return false
        end
    end

    def turn
        move = @player.get_move
        @remaining_misses -= 1 if !@board.attack(move)
        print "You have #{remaining_misses} shots left \n "
        print @board.print
    end

end
