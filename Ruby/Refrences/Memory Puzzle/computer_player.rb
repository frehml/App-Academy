class ComputerPlayer
    def initialize
        @current_guess = ""
        @cards = Hash.new{ |hash, key| hash[key] = []}
    end
    def get_input
        hash.each do |key, val|
            return val[0] if val.length == 2
        end
    end
end