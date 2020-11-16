require_relative 'board.rb'
require_relative 'card.rb'
require_relative 'human_player.rb'

class Game
    def initialize(size, player)
        @board = Board.new(size)
        @previous_guess = ""
        @player = player
    end
    def play
        @board.populate
        input = ""
        until @board.won?
            system("clear")
            @board.render
            input = @player.get_input
            make_guess(input)
        end
    end
    def make_guess(input)
        if @previous_guess.empty?
            @board[input].reveal
            @previous_guess = input
        elsif @board[@previous_guess].face_value == @board[input].face_value
            @board[input].reveal
            @previous_guess = []
            system("clear")
            @board.render
            print "\nIts a match!"
            sleep(1)
        else
            @board[input].reveal
            system("clear")
            @board.render
            print "\nTry again."
            sleep(1)
            @board[input].hide
            @board[@previous_guess].hide
            @previous_guess = []
        end
    end
end

p game = Game.new(4, HumanPlayer.new)
p game.play