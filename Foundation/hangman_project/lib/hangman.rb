class Hangman

  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    return DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    return @guess_word
  end

  def secret_word
    return @secret_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    return @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else
      return false
    end
  end

  def get_matching_indices(char)
    arr = []
    @secret_word.each_char.with_index do |ele, i|
      arr << i if ele == char
    end
    return arr
  end

  def fill_indices(char, arr)
    arr.each do |idx|
      @guess_word[idx] = char
    end
  end

  def try_guess(char)
    matching_indices = get_matching_indices(char)
    fill_indices(char, matching_indices)
    if get_matching_indices(char) == []
      @remaining_incorrect_guesses -= 1 
    end
    if already_attempted?(char)
      puts "that has already been attempted" 
      return false
    else
      @attempted_chars << char
      return true
    end
  end

  def ask_user_for_guess
    puts "Enter a char:"
    char = gets
    return try_guess(char.chomp)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if win?
      print secret_word
      return true
    elsif lose?
      print secret_word
      return true
    end
    return false
  end
end

