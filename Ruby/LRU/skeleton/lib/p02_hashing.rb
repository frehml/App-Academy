class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hasharray = []

    self.each do |ele|
      hasharray << (ele.hash).abs
    end

    if hasharray.empty?
      return(0)
    else  
      return(hasharray.join("").to_i)
    end
  end
end

class String
  def hash
    alphabet = ('a'..'z').to_a
    hasharray = []

    self.each_char do |char|
      hasharray << (alphabet.index(char)).abs if !alphabet.index(char).nil?
    end
    return (hasharray.join("")).to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hashnum = 0
    errything = ('a'..'z').to_a
    errything += (0..9).to_a

    self.each do |k,v|
      hashnum += errything.index(v).hash
    end
    
    return hashnum
  end
end
