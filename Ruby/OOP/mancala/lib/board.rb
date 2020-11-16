require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = place_stones
  end

  def place_stones
    array = []
    14.times do 
      array << [:stone, :stone, :stone, :stone]
    end
    array[6] = []
    array[13] = []
    array
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 13
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    amt_stones = @cups[start_pos].length
    @cups[start_pos] = []
    index = start_pos + 1

    amt_stones.times do 
      if current_player_name == @name1
        @cups[index%13] << :stone 
      else
        @cups[index%14] << :stone if start_pos != 6
      end
      index += 1 
    end
    render
    next_turn(index, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    if ending_cup_idx == 14 && current_player_name = @name2
      return :prompt
    elsif ending_cup_idx == 7 && current_player_name = @name1
      return :prompt
    elsif @cups[(ending_cup_idx%15)] == [:stone]
      return :switch
    else
      return ending_cup_idx - 1
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0...6].all? { |cup| cup.empty?} || @cups[7...13].all? { |cup| cup.empty?}
    false
  end

  def winner
    if @cups[6].length > @cups[13].length
        return @name1
      elsif @cups[6].length < @cups[13].length
        return @name2
      else
        return :draw
    end
  end
end
