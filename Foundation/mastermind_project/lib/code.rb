class Code

  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all?{ |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map!{ |peg| peg.upcase}
    else
      raise "Invalid pegs"
    end
  end

  def self.random(length)
    arr = []
    length.times {arr << POSSIBLE_PEGS.keys.sample}
    Code.new(arr)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    (0...guess.length).each do |idx|
      if guess[idx] == self[idx]
        count += 1 
      end
    end
    return count
  end

  def num_near_matches(guess)
    count = 0
    (0...guess.length).each do |idx|
      if guess[idx] != self[idx] && self.pegs.include?(guess[idx])
        count += 1 
      end
    end
    return count
  end

  def ==(instance)
    self.num_exact_matches(instance) == instance.pegs.length
  end
end