class GuessingGame
def initialize(min, max)
    @secret_num = rand(min..max)
    @num_attempts = 0
    @game_over = false
end
def num_attempts
    return @num_attempts
end
def game_over?
    return @game_over
end
def check_num(num)
    @num_attempts += 1
    @game_over = true if num == @secret_num
    if num == @secret_num
        puts "you win" 
    elsif num > @secret_num
        puts "too big"
    else
        puts "too small"
    end
end
def ask_user
puts "enter a number"
number = gets
num = number.chomp.to_i
check_num(num)
end
end
