require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game
    def initialize(n, hash)
        @players = []
        hash.each do |mark, comp| 
            if comp
                @players << ComputerPlayer.new(mark)
            else
                @players << HumanPlayer.new(mark) 
            end
        end
        @board = Board.new(n)
        @current_player = @players[0]
    end
    def switch_turn
        @current_player = @players.rotate!
    end
    def play
        while @board.empty_positions?
            @board.print
            pos = @players[0].get_position(@board.legal_positions)
            @board.place_mark(pos, @players[0].mark)
            if @board.win?(@players[0].mark)
                puts "Player " + (@players[0].mark).to_s + " won!"
                return
            else
                self.switch_turn
            end
        end
        return "Its a draw!"
    end
end

p game = Game.new(5, X: false, O: false)
game.play