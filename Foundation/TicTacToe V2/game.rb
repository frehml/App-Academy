require_relative "board.rb"
require_relative "human_player.rb"

class Game
    def initialize(*players_mark, n)
        @players = players_mark.map!{ |mark| HumanPlayer.new(mark) }
        @board = Board.new(n)
        @current_player = @players[0]
    end
    def switch_turn
        @current_player = @players.rotate!
    end
    def play
        while @board.empty_positions?
            @board.print
            p @players[0]
            pos = @players[0].get_position 
            @board.place_mark(pos, @players[0].mark)
            if @board.win?(@players[0].mark)
                puts @players[0].mark
                puts " won!"
                return
            else
                self.switch_turn
            end
        end
        return "Its a draw!"
    end
end

p game = Game.new(:X, :O, :Z, :A, 5)
p game.play