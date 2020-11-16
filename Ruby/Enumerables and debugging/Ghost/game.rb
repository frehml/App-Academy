require 'set'
require_relative 'player.rb'
require_relative 'ai_player.rb'

class Game
    def initialize(*players)
        @players = players.map{ |player| Player.new(player)}
        @fragment = ""
        @dictionary = File.open("dictionary.txt"){|file| file.readlines.to_set}
        @losses = Hash.new{ |hash, key| hash[key] = 0}
    end
    def current_player
        @players[0]
    end
    def next_player!
        @players.rotate!
    end
    def previous_player
        @players[-1]
    end
    def losses(player)
        @losses[player] += 1
    end
    def record(player)
        return "GHOST"[0...@losses[player]] + "\n" if @losses[player] > 0
        return "\n"
    end
    def take_turn(player)
        @fragment.chomp!
        guess = ""
        print "#{current_player.name} guess: "
        until valid_play?(guess)
            guess = gets
        end
        @fragment += guess
        print "Word: #{@fragment.chomp} \n"
        next_player!
    end
    def valid_play?(guess)
        if ('a'..'z').to_a.include?(guess[0]) && guess.length == 2 && @dictionary.any? {|word| word[0..@fragment.length].include?(@fragment.chomp + guess.chomp)}
            return true
        elsif guess == ""
            return false
        elsif guess.chomp == "quit"
            raise
        else
            print "Invalid guess, try again: "
            return false
        end
    end
    def play_round
        until @dictionary === @fragment
            take_turn(current_player)
        end
        losses(previous_player)
        print "#{previous_player.name} lost this round \n"
        @players.each { |player| print player.name + ": " + record(player)}
        @fragment = ""

    end
    def run
        until 1 == 2
            @players.each.with_index { |player, idx| @players.delete_at(idx) if record(player).chomp == "GHOST"}
            if @players.length == 1
                print "#{current_player.name} won! \n" 
                return
            end
            play_round
        end
    end
end

game = Game.new("player one", "player two", "player tres")
game.run