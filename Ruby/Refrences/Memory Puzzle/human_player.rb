class HumanPlayer
    def intialize
        @current_quess = ""
    end
    def get_input
        print "\n\nCoordinate (x,y): "
        @current_quess = gets.chomp
        return @current_quess
    end
end