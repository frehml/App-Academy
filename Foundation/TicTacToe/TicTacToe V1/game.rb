require_relative "board.rb"
require_relative "human_player.rb"

class Game
    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current_player = @player_1
    end
    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
        @current_player
    end
    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position 
            p @current_player
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts @current_player.mark
                puts " won!"
                return
            else
                self.switch_turn
            end
        end
        return "Its a draw!"
    end
end

p game = Game.new(:X, :O)
p game.play