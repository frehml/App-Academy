require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(instance)
        print "Exact matches: "
        print @secret_code.num_exact_matches(instance)
        print "\n"
        print "Near Matches: " 
        print @secret_code.num_near_matches(instance)
        print "\n"
    end

    def ask_user_for_guess
        print "Enter a code: "
        guess = gets.chomp
        raise if gets.chomp > @secret_code.length
        instance = Code.from_string(guess)
        self.print_matches(guess)
        @secret_code == instance
    end
end
